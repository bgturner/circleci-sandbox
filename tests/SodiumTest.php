<?php

test('The sodium extension is loaded', function () {
  expect(extension_loaded('sodium'))->toBeTrue();
});

test('Sodium functions that WordPress expects exist', function () {
    expect(function_exists('sodium_crypto_box'))->toBeTrue();
    expect(function_exists('sodium_crypto_stream_xchacha20_xor'))->toBeTrue();
    expect(function_exists('sodium_crypto_sign_verify_detached'))->toBeTrue();
    expect(function_exists('sodium_crypto_sign_verify_detached'))->toBeTrue();
});

test('Sodium constants are defined', function () {
  expect(defined( 'SODIUM_LIBRARY_VERSION' ))->toBeTrue();
});
