<?php

test('The filter extension is loaded', function () {
  expect(extension_loaded('filter'))->toBeTrue();
});
