<?php

test('The pcre extension is loaded', function () {
  expect(extension_loaded('pcre'))->toBeTrue();
});
