// Copyright 2022 Google LLC.
// SPDX-License-Identifier: Apache-2.0

// ported from: https://graphics.stanford.edu/~seander/bithacks.html#CountBitsSetParallel
fn popcount(v: u8) -> u8 {
  let v = v - ((v >> 1) & u8:0x55);
  let v = (v & u8:0x33) + ((v >> 2) & u8:0x33);
  (v + (v >> 4) & u8:0x0F)
}

#[test]
fn popcount_test() {
  let _= assert_eq(popcount(u8:0b0000_0000), u8:0);
  let _= assert_eq(popcount(u8:0b0000_0001), u8:1);
  let _= assert_eq(popcount(u8:0b1111_0000), u8:4);
  let _= assert_eq(popcount(u8:0b0101_0101), u8:4);
  let _= assert_eq(popcount(u8:0b1111_1111), u8:8);
  _
}

pub fn user_module(io_in: u8) -> u8 {
  popcount(io_in)
}
