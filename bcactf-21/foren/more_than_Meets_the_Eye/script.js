const REVERSE_BIT_TABLE = {
  "\u200b": 0,
  "\u200c": 1
};

const decode = (str) => {
  const bits = str.match(/[\u200b\u200c]/g);
  const out = new Uint8Array(bits.length >> 3);

  for (let i = 0; i < bits.length; ++i) {
    out[i >> 3] |= REVERSE_BIT_TABLE[bits[i]] << (7 - (i & 0x7));
  }

  return new TextDecoder().decode(out);
}