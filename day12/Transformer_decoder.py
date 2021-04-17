import sys
import os
import time
import numpy as np
import gin
import trax
from trax import layers as tl
from trax.fastmath import numpy as jnp
import textwrap

wrapper = textwrap.TextWrapper(width=70)
np.set_printoptions(threshold=sys.maxsize)

# Embeddings
# Positional encoding
def Positional_encoder(vocab_size, d_model, dropout, max_len, mode):
    # A list of layers
    return [
            tl.Embedding(vocab_size, d_model), 
            tl.Dropout(rate=dropout, mode=mode),
            tl.PositionalEncoding(max_len=max_len, mode=mode)
            ]


# Feed-Forward layer
def Feed_forward(d_model, d_feedforward, dropout, mode, feedforward_activation):
    # A list of layers;
    # maps an activation tensor to an activation tensor
    return [
            tl.LayerNorm(), 
            tl.Dense(d_feedforward), 
            feedforward_activation(),  # ReLU
            tl.Dropout(rate=dropout, mode=mode), 
            tl.Dense(d_model), 
            tl.Dropout(rate=dropout, mode=mode)
            ]


# Decoder block
def Decoder_block(d_model, d_feedforward, n_heads, dropout, mode, feedforward_activation):        
    # A list of two Residual blocks: the attention with normalization and dropout and feed-forward blocks
    return [
      tl.Residual(
          tl.LayerNorm(), 
          tl.CausalAttention(d_model, n_heads=n_heads, dropout=dropout, mode=mode) 
        ),
      tl.Residual(
          # the normalization layer is included
          FeedForward(d_model, d_feedforward, dropout, mode, feedforward_activation)
        ),
      ]


def Transformer_language_model(vocab_size=33300,
                  d_model=512,
                  d_ff=2048,
                  n_layers=6,
                  n_heads=8,
                  dropout=0.1,
                  max_len=4096,
                  mode='train',
                  ff_activation=tl.Relu):
    
    # Stack (list) of decoder blocks
    decoder_blocks = [DecoderBlock(d_model, d_ff, n_heads, dropout, mode, ff_activation) for _ in range(n_layers)] 

    # LM is a layer that maps from a tensor of tokens
    return tl.Serial(
        # Teacher forcing: we feed output of previous step to current step
        tl.ShiftRight(mode=mode), 
        PositionalEncoder(vocab_size, d_model, dropout, max_len, mode),
        decoder_blocks, 
        tl.LayerNorm(), 
        tl.Dense(vocab_size), 
        tl.LogSoftmax() 
    )
