// Copyright (c) 2017, Agilord. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:ulid/ulid.dart';
import 'package:test/test.dart';

void main() {
  test('length', () {
    final Ulid id = new Ulid();
    expect(id.toCanonical(), hasLength(26));
    expect(id.toUuid(), hasLength(36));
    expect(id.toUuid(compact: true), hasLength(32));
  });

  test('fixed time', () {
    final Ulid id = new Ulid(millis: 1469918176385);
    expect(id.toCanonical().substring(0, 10), '01aryz6s41');
    expect(id.toMillis(), 1469918176385);
  });

  test('parse compact', () {
    final Ulid id = new Ulid.parse('01bj755t69g1r3e2c7fseyb102');
    expect(id.toCanonical(), '01bj755t69g1r3e2c7fseyb102');
    expect(id.toUuid(), '015c8e52-e8c9-8070-3709-877e5de58402');
    expect(id.toMillis(), 1497036417225);
  });

  test('parse uuid', () {
    final Ulid id = new Ulid.parse('015c8e52-e8c9-8070-3709-877e5de58402');
    expect(id.toCanonical(), '01bj755t69g1r3e2c7fseyb102');
    expect(id.toUuid(), '015c8e52-e8c9-8070-3709-877e5de58402');
    expect(id.toMillis(), 1497036417225);
  });
}
