<?php

test('The bcmath extension is loaded', function () {
  expect(extension_loaded('bcmath'))->toBeTrue();
});
