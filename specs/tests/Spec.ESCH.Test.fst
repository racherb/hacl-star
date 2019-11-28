module Spec.ESCH.Test

open FStar.Mul
open Lib.IntTypes
open Lib.RawIntTypes
open Lib.Sequence
open Lib.ByteSequence


//
// Test 1
//
let test1_plaintext_list = List.Tot.map u8_from_UInt8 [

]
let test1_plaintext : lbytes 0 =
  assert_norm (List.Tot.length test1_plaintext_list = 0);
  of_list test1_plaintext_list


let test1_expected_256_list = List.Tot.map u8_from_UInt8 [
  0xc0uy; 0xe8uy; 0x15uy; 0xd7uy; 0x8buy; 0x87uy; 0x5duy; 0xc7uy;
  0x68uy; 0xc6uy; 0xc8uy; 0xb3uy; 0xafuy; 0xa5uy; 0x19uy; 0x87uy;
  0xcduy; 0x69uy; 0xe5uy; 0xc0uy; 0x87uy; 0xd3uy; 0x87uy; 0x36uy;
  0x86uy; 0x28uy; 0xa5uy; 0x11uy; 0xcfuy; 0xaduy; 0x57uy; 0x30uy
]
let test1_expected_256 : lbytes 32 =
  assert_norm (List.Tot.length test1_expected_256_list = 32);
  of_list test1_expected_256_list

let test1_expected_384_list = List.Tot.map u8_from_UInt8 [
  0x29uy; 0x81uy; 0x71uy; 0x5euy; 0x22uy; 0x63uy; 0xebuy; 0xd0uy;
  0xcbuy; 0x6euy; 0x5cuy; 0x2cuy; 0x99uy; 0xd0uy; 0x77uy; 0x6duy;
  0x5euy; 0x69uy; 0x1euy; 0xe7uy; 0x37uy; 0xfduy; 0xe0uy; 0x52uy;
  0x47uy; 0x89uy; 0x5euy; 0x75uy; 0xd0uy; 0x2euy; 0x74uy; 0x47uy;
  0xfduy; 0x6auy; 0xb7uy; 0x07uy; 0xe2uy; 0xecuy; 0x83uy; 0x85uy;
  0xa5uy; 0x39uy; 0x77uy; 0x79uy; 0x65uy; 0xe4uy; 0x72uy; 0xeeuy
]
let test1_expected_384 : lbytes 48 =
  assert_norm (List.Tot.length test1_expected_384_list = 48);
  of_list test1_expected_384_list

//
// Test 2
//
let test2_plaintext_list = List.Tot.map u8_from_UInt8 [
  0x00uy; 0x01uy; 0x02uy; 0x03uy; 0x04uy; 0x05uy; 0x06uy; 0x07uy;
  0x08uy; 0x09uy; 0x0auy; 0x0buy; 0x0cuy; 0x0duy; 0x0euy; 0x0fuy;
  0x10uy; 0x11uy; 0x12uy; 0x13uy; 0x14uy; 0x15uy; 0x16uy; 0x17uy;
  0x18uy; 0x19uy; 0x1auy; 0x1buy; 0x1cuy; 0x1duy; 0x1euy; 0x1fuy;
  0x20uy; 0x21uy; 0x22uy; 0x23uy; 0x24uy; 0x25uy; 0x26uy; 0x27uy;
  0x28uy; 0x29uy; 0x2auy; 0x2buy; 0x2cuy; 0x2duy; 0x2euy; 0x2fuy;
  0x30uy; 0x31uy; 0x32uy; 0x33uy; 0x34uy; 0x35uy; 0x36uy; 0x37uy;
  0x38uy; 0x39uy; 0x3auy; 0x3buy; 0x3cuy; 0x3duy; 0x3euy; 0x3fuy;
  0x40uy; 0x41uy; 0x42uy; 0x43uy; 0x44uy; 0x45uy; 0x46uy; 0x47uy;
  0x48uy; 0x49uy; 0x4auy; 0x4buy; 0x4cuy; 0x4duy; 0x4euy; 0x4fuy;
  0x50uy; 0x51uy; 0x52uy; 0x53uy; 0x54uy; 0x55uy; 0x56uy; 0x57uy;
  0x58uy; 0x59uy; 0x5auy; 0x5buy; 0x5cuy; 0x5duy; 0x5euy; 0x5fuy;
  0x60uy; 0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy;
  0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy; 0x75uy; 0x76uy; 0x77uy;
  0x78uy; 0x79uy; 0x7auy; 0x7buy; 0x7cuy; 0x7duy; 0x7euy; 0x7fuy;
  0x80uy; 0x81uy; 0x82uy; 0x83uy; 0x84uy; 0x85uy; 0x86uy; 0x87uy;
  0x88uy; 0x89uy; 0x8auy; 0x8buy; 0x8cuy; 0x8duy; 0x8euy; 0x8fuy;
  0x90uy; 0x91uy; 0x92uy; 0x93uy; 0x94uy; 0x95uy; 0x96uy; 0x97uy;
  0x98uy; 0x99uy; 0x9auy; 0x9buy; 0x9cuy; 0x9duy; 0x9euy; 0x9fuy;
  0xa0uy; 0xa1uy; 0xa2uy; 0xa3uy; 0xa4uy; 0xa5uy; 0xa6uy; 0xa7uy;
  0xa8uy; 0xa9uy; 0xaauy; 0xabuy; 0xacuy; 0xaduy; 0xaeuy; 0xafuy;
  0xb0uy; 0xb1uy; 0xb2uy; 0xb3uy; 0xb4uy; 0xb5uy; 0xb6uy; 0xb7uy;
  0xb8uy; 0xb9uy; 0xbauy; 0xbbuy; 0xbcuy; 0xbduy; 0xbeuy; 0xbfuy;
  0xc0uy; 0xc1uy; 0xc2uy; 0xc3uy; 0xc4uy; 0xc5uy; 0xc6uy; 0xc7uy;
  0xc8uy; 0xc9uy; 0xcauy; 0xcbuy; 0xccuy; 0xcduy; 0xceuy; 0xcfuy;
  0xd0uy; 0xd1uy; 0xd2uy; 0xd3uy; 0xd4uy; 0xd5uy; 0xd6uy; 0xd7uy;
  0xd8uy; 0xd9uy; 0xdauy; 0xdbuy; 0xdcuy; 0xdduy; 0xdeuy; 0xdfuy;
  0xe0uy; 0xe1uy; 0xe2uy; 0xe3uy; 0xe4uy; 0xe5uy; 0xe6uy; 0xe7uy;
  0xe8uy; 0xe9uy; 0xeauy; 0xebuy; 0xecuy; 0xeduy; 0xeeuy; 0xefuy;
  0xf0uy; 0xf1uy; 0xf2uy; 0xf3uy; 0xf4uy; 0xf5uy; 0xf6uy; 0xf7uy;
  0xf8uy; 0xf9uy; 0xfauy; 0xfbuy; 0xfcuy; 0xfduy; 0xfeuy; 0xffuy;
  0x00uy; 0x01uy; 0x02uy; 0x03uy; 0x04uy; 0x05uy; 0x06uy; 0x07uy;
  0x08uy; 0x09uy; 0x0auy; 0x0buy; 0x0cuy; 0x0duy; 0x0euy; 0x0fuy;
  0x10uy; 0x11uy; 0x12uy; 0x13uy; 0x14uy; 0x15uy; 0x16uy; 0x17uy;
  0x18uy; 0x19uy; 0x1auy; 0x1buy; 0x1cuy; 0x1duy; 0x1euy; 0x1fuy;
  0x20uy; 0x21uy; 0x22uy; 0x23uy; 0x24uy; 0x25uy; 0x26uy; 0x27uy;
  0x28uy; 0x29uy; 0x2auy; 0x2buy; 0x2cuy; 0x2duy; 0x2euy; 0x2fuy;
  0x30uy; 0x31uy; 0x32uy; 0x33uy; 0x34uy; 0x35uy; 0x36uy; 0x37uy;
  0x38uy; 0x39uy; 0x3auy; 0x3buy; 0x3cuy; 0x3duy; 0x3euy; 0x3fuy;
  0x40uy; 0x41uy; 0x42uy; 0x43uy; 0x44uy; 0x45uy; 0x46uy; 0x47uy;
  0x48uy; 0x49uy; 0x4auy; 0x4buy; 0x4cuy; 0x4duy; 0x4euy; 0x4fuy;
  0x50uy; 0x51uy; 0x52uy; 0x53uy; 0x54uy; 0x55uy; 0x56uy; 0x57uy;
  0x58uy; 0x59uy; 0x5auy; 0x5buy; 0x5cuy; 0x5duy; 0x5euy; 0x5fuy;
  0x60uy; 0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy;
  0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy; 0x75uy; 0x76uy; 0x77uy;
  0x78uy; 0x79uy; 0x7auy; 0x7buy; 0x7cuy; 0x7duy; 0x7euy; 0x7fuy;
  0x80uy; 0x81uy; 0x82uy; 0x83uy; 0x84uy; 0x85uy; 0x86uy; 0x87uy;
  0x88uy; 0x89uy; 0x8auy; 0x8buy; 0x8cuy; 0x8duy; 0x8euy; 0x8fuy;
  0x90uy; 0x91uy; 0x92uy; 0x93uy; 0x94uy; 0x95uy; 0x96uy; 0x97uy;
  0x98uy; 0x99uy; 0x9auy; 0x9buy; 0x9cuy; 0x9duy; 0x9euy; 0x9fuy;
  0xa0uy; 0xa1uy; 0xa2uy; 0xa3uy; 0xa4uy; 0xa5uy; 0xa6uy; 0xa7uy;
  0xa8uy; 0xa9uy; 0xaauy; 0xabuy; 0xacuy; 0xaduy; 0xaeuy; 0xafuy;
  0xb0uy; 0xb1uy; 0xb2uy; 0xb3uy; 0xb4uy; 0xb5uy; 0xb6uy; 0xb7uy;
  0xb8uy; 0xb9uy; 0xbauy; 0xbbuy; 0xbcuy; 0xbduy; 0xbeuy; 0xbfuy;
  0xc0uy; 0xc1uy; 0xc2uy; 0xc3uy; 0xc4uy; 0xc5uy; 0xc6uy; 0xc7uy;
  0xc8uy; 0xc9uy; 0xcauy; 0xcbuy; 0xccuy; 0xcduy; 0xceuy; 0xcfuy;
  0xd0uy; 0xd1uy; 0xd2uy; 0xd3uy; 0xd4uy; 0xd5uy; 0xd6uy; 0xd7uy;
  0xd8uy; 0xd9uy; 0xdauy; 0xdbuy; 0xdcuy; 0xdduy; 0xdeuy; 0xdfuy;
  0xe0uy; 0xe1uy; 0xe2uy; 0xe3uy; 0xe4uy; 0xe5uy; 0xe6uy; 0xe7uy;
  0xe8uy; 0xe9uy; 0xeauy; 0xebuy; 0xecuy; 0xeduy; 0xeeuy; 0xefuy;
  0xf0uy; 0xf1uy; 0xf2uy; 0xf3uy; 0xf4uy; 0xf5uy; 0xf6uy; 0xf7uy;
  0xf8uy; 0xf9uy; 0xfauy; 0xfbuy; 0xfcuy; 0xfduy; 0xfeuy; 0xffuy;
  0x00uy; 0x01uy; 0x02uy; 0x03uy; 0x04uy; 0x05uy; 0x06uy; 0x07uy;
  0x08uy; 0x09uy; 0x0auy; 0x0buy; 0x0cuy; 0x0duy; 0x0euy; 0x0fuy;
  0x10uy; 0x11uy; 0x12uy; 0x13uy; 0x14uy; 0x15uy; 0x16uy; 0x17uy;
  0x18uy; 0x19uy; 0x1auy; 0x1buy; 0x1cuy; 0x1duy; 0x1euy; 0x1fuy;
  0x20uy; 0x21uy; 0x22uy; 0x23uy; 0x24uy; 0x25uy; 0x26uy; 0x27uy;
  0x28uy; 0x29uy; 0x2auy; 0x2buy; 0x2cuy; 0x2duy; 0x2euy; 0x2fuy;
  0x30uy; 0x31uy; 0x32uy; 0x33uy; 0x34uy; 0x35uy; 0x36uy; 0x37uy;
  0x38uy; 0x39uy; 0x3auy; 0x3buy; 0x3cuy; 0x3duy; 0x3euy; 0x3fuy;
  0x40uy; 0x41uy; 0x42uy; 0x43uy; 0x44uy; 0x45uy; 0x46uy; 0x47uy;
  0x48uy; 0x49uy; 0x4auy; 0x4buy; 0x4cuy; 0x4duy; 0x4euy; 0x4fuy;
  0x50uy; 0x51uy; 0x52uy; 0x53uy; 0x54uy; 0x55uy; 0x56uy; 0x57uy;
  0x58uy; 0x59uy; 0x5auy; 0x5buy; 0x5cuy; 0x5duy; 0x5euy; 0x5fuy;
  0x60uy; 0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy;
  0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy; 0x75uy; 0x76uy; 0x77uy;
  0x78uy; 0x79uy; 0x7auy; 0x7buy; 0x7cuy; 0x7duy; 0x7euy; 0x7fuy;
  0x80uy; 0x81uy; 0x82uy; 0x83uy; 0x84uy; 0x85uy; 0x86uy; 0x87uy;
  0x88uy; 0x89uy; 0x8auy; 0x8buy; 0x8cuy; 0x8duy; 0x8euy; 0x8fuy;
  0x90uy; 0x91uy; 0x92uy; 0x93uy; 0x94uy; 0x95uy; 0x96uy; 0x97uy;
  0x98uy; 0x99uy; 0x9auy; 0x9buy; 0x9cuy; 0x9duy; 0x9euy; 0x9fuy;
  0xa0uy; 0xa1uy; 0xa2uy; 0xa3uy; 0xa4uy; 0xa5uy; 0xa6uy; 0xa7uy;
  0xa8uy; 0xa9uy; 0xaauy; 0xabuy; 0xacuy; 0xaduy; 0xaeuy; 0xafuy;
  0xb0uy; 0xb1uy; 0xb2uy; 0xb3uy; 0xb4uy; 0xb5uy; 0xb6uy; 0xb7uy;
  0xb8uy; 0xb9uy; 0xbauy; 0xbbuy; 0xbcuy; 0xbduy; 0xbeuy; 0xbfuy;
  0xc0uy; 0xc1uy; 0xc2uy; 0xc3uy; 0xc4uy; 0xc5uy; 0xc6uy; 0xc7uy;
  0xc8uy; 0xc9uy; 0xcauy; 0xcbuy; 0xccuy; 0xcduy; 0xceuy; 0xcfuy;
  0xd0uy; 0xd1uy; 0xd2uy; 0xd3uy; 0xd4uy; 0xd5uy; 0xd6uy; 0xd7uy;
  0xd8uy; 0xd9uy; 0xdauy; 0xdbuy; 0xdcuy; 0xdduy; 0xdeuy; 0xdfuy;
  0xe0uy; 0xe1uy; 0xe2uy; 0xe3uy; 0xe4uy; 0xe5uy; 0xe6uy; 0xe7uy;
  0xe8uy; 0xe9uy; 0xeauy; 0xebuy; 0xecuy; 0xeduy; 0xeeuy; 0xefuy;
  0xf0uy; 0xf1uy; 0xf2uy; 0xf3uy; 0xf4uy; 0xf5uy; 0xf6uy; 0xf7uy;
  0xf8uy; 0xf9uy; 0xfauy; 0xfbuy; 0xfcuy; 0xfduy; 0xfeuy; 0xffuy;
  0x00uy; 0x01uy; 0x02uy; 0x03uy; 0x04uy; 0x05uy; 0x06uy; 0x07uy;
  0x08uy; 0x09uy; 0x0auy; 0x0buy; 0x0cuy; 0x0duy; 0x0euy; 0x0fuy;
  0x10uy; 0x11uy; 0x12uy; 0x13uy; 0x14uy; 0x15uy; 0x16uy; 0x17uy;
  0x18uy; 0x19uy; 0x1auy; 0x1buy; 0x1cuy; 0x1duy; 0x1euy; 0x1fuy;
  0x20uy; 0x21uy; 0x22uy; 0x23uy; 0x24uy; 0x25uy; 0x26uy; 0x27uy;
  0x28uy; 0x29uy; 0x2auy; 0x2buy; 0x2cuy; 0x2duy; 0x2euy; 0x2fuy;
  0x30uy; 0x31uy; 0x32uy; 0x33uy; 0x34uy; 0x35uy; 0x36uy; 0x37uy;
  0x38uy; 0x39uy; 0x3auy; 0x3buy; 0x3cuy; 0x3duy; 0x3euy; 0x3fuy;
  0x40uy; 0x41uy; 0x42uy; 0x43uy; 0x44uy; 0x45uy; 0x46uy; 0x47uy;
  0x48uy; 0x49uy; 0x4auy; 0x4buy; 0x4cuy; 0x4duy; 0x4euy; 0x4fuy;
  0x50uy; 0x51uy; 0x52uy; 0x53uy; 0x54uy; 0x55uy; 0x56uy; 0x57uy;
  0x58uy; 0x59uy; 0x5auy; 0x5buy; 0x5cuy; 0x5duy; 0x5euy; 0x5fuy;
  0x60uy; 0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy;
  0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy; 0x75uy; 0x76uy; 0x77uy;
  0x78uy; 0x79uy; 0x7auy; 0x7buy; 0x7cuy; 0x7duy; 0x7euy; 0x7fuy;
  0x80uy; 0x81uy; 0x82uy; 0x83uy; 0x84uy; 0x85uy; 0x86uy; 0x87uy;
  0x88uy; 0x89uy; 0x8auy; 0x8buy; 0x8cuy; 0x8duy; 0x8euy; 0x8fuy;
  0x90uy; 0x91uy; 0x92uy; 0x93uy; 0x94uy; 0x95uy; 0x96uy; 0x97uy;
  0x98uy; 0x99uy; 0x9auy; 0x9buy; 0x9cuy; 0x9duy; 0x9euy; 0x9fuy;
  0xa0uy; 0xa1uy; 0xa2uy; 0xa3uy; 0xa4uy; 0xa5uy; 0xa6uy; 0xa7uy;
  0xa8uy; 0xa9uy; 0xaauy; 0xabuy; 0xacuy; 0xaduy; 0xaeuy; 0xafuy;
  0xb0uy; 0xb1uy; 0xb2uy; 0xb3uy; 0xb4uy; 0xb5uy; 0xb6uy; 0xb7uy;
  0xb8uy; 0xb9uy; 0xbauy; 0xbbuy; 0xbcuy; 0xbduy; 0xbeuy; 0xbfuy;
  0xc0uy; 0xc1uy; 0xc2uy; 0xc3uy; 0xc4uy; 0xc5uy; 0xc6uy; 0xc7uy;
  0xc8uy; 0xc9uy; 0xcauy; 0xcbuy; 0xccuy; 0xcduy; 0xceuy; 0xcfuy;
  0xd0uy; 0xd1uy; 0xd2uy; 0xd3uy; 0xd4uy; 0xd5uy; 0xd6uy; 0xd7uy;
  0xd8uy; 0xd9uy; 0xdauy; 0xdbuy; 0xdcuy; 0xdduy; 0xdeuy; 0xdfuy;
  0xe0uy; 0xe1uy; 0xe2uy; 0xe3uy; 0xe4uy; 0xe5uy; 0xe6uy; 0xe7uy;
  0xe8uy; 0xe9uy; 0xeauy; 0xebuy; 0xecuy; 0xeduy; 0xeeuy; 0xefuy;
  0xf0uy; 0xf1uy; 0xf2uy; 0xf3uy; 0xf4uy; 0xf5uy; 0xf6uy; 0xf7uy;
  0xf8uy; 0xf9uy; 0xfauy; 0xfbuy; 0xfcuy; 0xfduy; 0xfeuy; 0xffuy
]
let test2_plaintext : lbytes 1024 =
  assert_norm (List.Tot.length test2_plaintext_list = 1024);
  of_list test2_plaintext_list

let test2_expected_256_list = List.Tot.map u8_from_UInt8 [
  0x2euy; 0xfduy; 0x30uy; 0x05uy; 0x25uy; 0xb3uy; 0xa4uy; 0xfeuy;
  0x87uy; 0x93uy; 0x33uy; 0x34uy; 0xe2uy; 0xc8uy; 0x7auy; 0xffuy;
  0xefuy; 0xb6uy; 0x5buy; 0x4fuy; 0x59uy; 0xbduy; 0x72uy; 0xc2uy;
  0xafuy; 0x3fuy; 0x7auy; 0x69uy; 0x74uy; 0x0duy; 0x0duy; 0x15uy
]
let test2_expected_256 : lbytes 32 =
  assert_norm (List.Tot.length test2_expected_256_list = 32);
  of_list test2_expected_256_list

let test2_expected_384_list = List.Tot.map u8_from_UInt8 [
  0x16uy; 0x74uy; 0x88uy; 0xdfuy; 0x37uy; 0xdduy; 0x40uy; 0x6cuy;
  0x72uy; 0x93uy; 0x28uy; 0xa4uy; 0x51uy; 0xd7uy; 0x9duy; 0xcauy;
  0x2auy; 0xe1uy; 0xfauy; 0x1fuy; 0xffuy; 0x03uy; 0x88uy; 0x8cuy;
  0x2auy; 0xd8uy; 0x6duy; 0xb5uy; 0x07uy; 0xa9uy; 0x2euy; 0x46uy;
  0x76uy; 0x9cuy; 0xb0uy; 0x7cuy; 0x7duy; 0x31uy; 0xa1uy; 0x8euy;
  0xcbuy; 0xf5uy; 0xa0uy; 0xb3uy; 0xe3uy; 0xf1uy; 0xf6uy; 0x78uy
]
let test2_expected_384 : lbytes 48 =
  assert_norm (List.Tot.length test2_expected_384_list = 48);
  of_list test2_expected_384_list


//
// Main
//

let test () =

  IO.print_string "\nTEST 1\n";
  // let test1_input_len : size_nat = List.Tot.length test1_input in
  // let test1_input : lbytes test1_input_len = createL test1_input in

  // let test1_expected : lbytes 32 = createL test1_expected in
  // let test1_result : lbytes 32 = Spec.ESCH.esch Spec.ESCH.ESCH_256 test1_input in
  // let result1 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected test1_result in

  // IO.print_string "\nExpected Esch : ";
  // List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (to_list test1_expected);
  // IO.print_string "\nComputed Esch : ";
  // List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (to_list test1_result);

  // assert_norm (List.Tot.length test1_plaintext_list <= max_size_t);
  let test1_result_256 : lbytes 32 =
    Spec.ESCH.esch Spec.ESCH.ESCH_256 test1_plaintext
  in
  let result1_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected_256 test1_result_256 in
  IO.print_string "\n1. ESCH256 Result  : ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test1_result_256);
  IO.print_string "\n1. ESCH256 Expected: ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test1_expected_256);

  let test1_result_384 : lbytes 48 =
    Spec.ESCH.esch Spec.ESCH.ESCH_384 test1_plaintext
  in
  let result1_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected_384 test1_result_384 in
  IO.print_string "\n1. ESCH384 Result  : ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test1_result_384);
  IO.print_string "\n1. ESCH384 Expected: ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test1_expected_384);


  // assert_norm (List.Tot.length test2_plaintext_list <= max_size_t);
  let test2_result_256 : lbytes 32 =
    Spec.ESCH.esch Spec.ESCH.ESCH_256 test2_plaintext
  in
  let result2_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected_256 test2_result_256 in
  IO.print_string "\n2. ESCH256 Result  : ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test2_result_256);
  IO.print_string "\n2. ESCH256 Expected: ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test2_expected_256);

  let test2_result_384 : lbytes 48 =
    Spec.ESCH.esch Spec.ESCH.ESCH_384 test2_plaintext
  in
  let result2_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected_384 test2_result_384 in
  IO.print_string "\n2. ESCH384 Result  : ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test2_result_384);
  IO.print_string "\n2. ESCH384 Expected: ";
  List.iter (fun a -> IO.print_uint8 (u8_to_UInt8 a)) (to_list test2_expected_384);


  if result1_256 && result1_384 &&
     result2_256 && result2_384
  then IO.print_string "\nEsch Test1: Success!\n"
  else IO.print_string "\nEsch Test1: Failure :(\n"
