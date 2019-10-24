Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEBEE2CA4
	for <lists+nouveau@lfdr.de>; Thu, 24 Oct 2019 10:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682586E155;
	Thu, 24 Oct 2019 08:53:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597E6E155
 for <nouveau@lists.freedesktop.org>; Thu, 24 Oct 2019 08:53:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-GebWDdG4MU2KhJNoS0M-Zw-1; Thu, 24 Oct 2019 04:52:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E5B51005512;
 Thu, 24 Oct 2019 08:52:57 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9355D6D0;
 Thu, 24 Oct 2019 08:52:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 24 Oct 2019 10:52:53 +0200
Message-Id: <20191024085253.6566-2-hdegoede@redhat.com>
In-Reply-To: <20191024085253.6566-1-hdegoede@redhat.com>
References: <20191024085253.6566-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: GebWDdG4MU2KhJNoS0M-Zw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571907179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoV6DzXYu8bUuM/NNUYGgFQ1op1N3X6bU62PxI0EkZs=;
 b=TWy51HbOmtZYhF7iBIJUdrTWAfq/FTgIN0Gig7bTabIjHoh8pSJusOqNQbh5vGDnndApwz
 NM1zyvI38oT18Qh50Ep+1mKDlvnXFAL3Wdmo24oPQnEe9TU0VY7hBrSHeZMTm7CrKVNhce
 Z2Oc4/qKIyIPCWDjtIJo9hLklbsCpsQ=
Subject: [Nouveau] [PATCH v2 2/2] drm/nouveau: Fix drm-core using atomic
 code-paths on pre-nv50 hardware
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2UgZG8gbm90IHN1cHBvcnQgYXRvbWljIG1vZGVzZXR0aW5nIG9uIHByZS1udjUwIGhhcmR3YXJl
LCBidXQgdW50aWwgbm93Cm91ciBjb25uZWN0b3IgY29kZSB3YXMgc2V0dGluZyBkcm1fY29ubmVj
dG9yLT5zdGF0ZSBvbiBwcmUtbnY1MCBoYXJkd2FyZS4KClRoaXMgY2F1c2VzIHRoZSBjb3JlIHRv
IGVudGVyIGF0b21pYyBtb2Rlc2V0dGluZyBwYXRocyBpbiBhdCBsZWFzdDoKCjEuIGRybV9jb25u
ZWN0b3JfZ2V0X2VuY29kZXIoKSwgcmV0dXJuaW5nIGNvbm5lY3Rvci0+c3RhdGUtPmJlc3RfZW5j
b2Rlcgp3aGljaCBpcyBhbHdheXMgMCwgY2F1c2luZyB1cyB0byBhbHdheXMgcmVwb3J0IDAgYXMg
ZW5jb2Rlcl9pZCBpbgp0aGUgZHJtTW9kZUNvbm5lY3RvciBzdHJ1Y3QgcmV0dXJuZWQgYnkgZHJt
TW9kZUdldENvbm5lY3RvcigpLgoKMi4gZHJtX2VuY29kZXJfZ2V0X2NydGMoKSwgcmV0dXJuaW5n
IE5VTEwgYmVjYXVzZSB1c2VzX2F0b21pYyBnZXQgc2V0LApjYXVzaW5nIHVzIHRvIGFsd2F5cyBy
ZXBvcnQgMCBhcyBjcnRjX2lkIGluIHRoZSBkcm1Nb2RlRW5jb2RlciBzdHJ1Y3QKcmV0dXJuZWQg
YnkgZHJtTW9kZUdldEVuY29kZXIoKQoKV2hpY2ggaW4gdHVybiBjb25mdXNlcyB1c2Vyc3BhY2Us
IGF0IGxlYXN0IHBseW1vdXRoIHRoaW5rcyB0aGF0IHRoZSBwaXBlCmhhcyBjaGFuZ2VkIGJlY2F1
c2Ugb2YgdGhpcyBhbmQgdHJpZXMgdG8gcmVjb25maWd1cmUgaXQgdW5uZWNlc3NhcmlseS4KCk1v
cmUgaW4gZ2VuZXJhbCB3ZSBzaG91bGQgbm90IHNldCBkcm1fY29ubmVjdG9yLT5zdGF0ZSBpbiB0
aGUgbm9uLWF0b21pYwpjb2RlIGFzIHRoaXMgdmlvbGF0ZXMgdGhlIGRybS1jb3JlJ3MgZXhwZWN0
YXRpb25zLgoKVGhpcyBjb21taXQgZml4ZXMgdGhpcyBieSB1c2luZyBhIG5vdXZlYXVfY29ubl9h
dG9tIHN0cnVjdCBlbWJlZGRlZCBpbiB0aGUKbm91dmVhdV9jb25uZWN0b3Igc3RydWN0IGZvciBw
cm9wZXJ0eSBoYW5kbGluZyBpbiB0aGUgbm9uLWF0b21pYyBjYXNlLgoKRml4ZXM6IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTcwNjU1NwpTaWduZWQtb2ZmLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoK
LUZpeCB0cmFpbGluZyB3aGl0ZXNwYWNlIGlzc3VlCi0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9jb25uZWN0b3IuYyB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuaCB8ICA2ICsrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKaW5kZXggOTRkZmEyZTVhOWFiLi44MDVi
MzQxZGIxNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
YwpAQCAtMjQ1LDE0ICsyNDUsMjIgQEAgbm91dmVhdV9jb25uX2F0b21pY19kdXBsaWNhdGVfc3Rh
dGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHZvaWQKIG5vdXZlYXVfY29ubl9y
ZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogeworCXN0cnVjdCBub3V2ZWF1
X2Nvbm5lY3RvciAqbnZfY29ubmVjdG9yID0gbm91dmVhdV9jb25uZWN0b3IoY29ubmVjdG9yKTsK
IAlzdHJ1Y3Qgbm91dmVhdV9jb25uX2F0b20gKmFzeWM7CiAKLQlpZiAoV0FSTl9PTighKGFzeWMg
PSBremFsbG9jKHNpemVvZigqYXN5YyksIEdGUF9LRVJORUwpKSkpCi0JCXJldHVybjsKKwlpZiAo
ZHJtX2Rydl91c2VzX2F0b21pY19tb2Rlc2V0KGNvbm5lY3Rvci0+ZGV2KSkgeworCQlpZiAoV0FS
Tl9PTighKGFzeWMgPSBremFsbG9jKHNpemVvZigqYXN5YyksIEdGUF9LRVJORUwpKSkpCisJCQly
ZXR1cm47CisKKwkJaWYgKGNvbm5lY3Rvci0+c3RhdGUpCisJCQlub3V2ZWF1X2Nvbm5fYXRvbWlj
X2Rlc3Ryb3lfc3RhdGUoY29ubmVjdG9yLAorCQkJCQkJCSAgY29ubmVjdG9yLT5zdGF0ZSk7CisK
KwkJX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoY29ubmVjdG9yLCAmYXN5Yy0+
c3RhdGUpOworCX0gZWxzZSB7CisJCWFzeWMgPSAmbnZfY29ubmVjdG9yLT5wcm9wZXJ0aWVzX3N0
YXRlOworCX0KIAotCWlmIChjb25uZWN0b3ItPnN0YXRlKQotCQlub3V2ZWF1X2Nvbm5fYXRvbWlj
X2Rlc3Ryb3lfc3RhdGUoY29ubmVjdG9yLCBjb25uZWN0b3ItPnN0YXRlKTsKLQlfX2RybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChjb25uZWN0b3IsICZhc3ljLT5zdGF0ZSk7CiAJYXN5
Yy0+ZGl0aGVyLm1vZGUgPSBESVRIRVJJTkdfTU9ERV9BVVRPOwogCWFzeWMtPmRpdGhlci5kZXB0
aCA9IERJVEhFUklOR19ERVBUSF9BVVRPOwogCWFzeWMtPnNjYWxlci5tb2RlID0gRFJNX01PREVf
U0NBTEVfTk9ORTsKQEAgLTI3Niw4ICsyODQsMTQgQEAgdm9pZAogbm91dmVhdV9jb25uX2F0dGFj
aF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2OwotCXN0cnVjdCBub3V2ZWF1X2Nvbm5f
YXRvbSAqYXJtYyA9IG5vdXZlYXVfY29ubl9hdG9tKGNvbm5lY3Rvci0+c3RhdGUpOwogCXN0cnVj
dCBub3V2ZWF1X2Rpc3BsYXkgKmRpc3AgPSBub3V2ZWF1X2Rpc3BsYXkoZGV2KTsKKwlzdHJ1Y3Qg
bm91dmVhdV9jb25uZWN0b3IgKm52X2Nvbm5lY3RvciA9IG5vdXZlYXVfY29ubmVjdG9yKGNvbm5l
Y3Rvcik7CisJc3RydWN0IG5vdXZlYXVfY29ubl9hdG9tICphcm1jOworCisJaWYgKGRybV9kcnZf
dXNlc19hdG9taWNfbW9kZXNldChjb25uZWN0b3ItPmRldikpCisJCWFybWMgPSBub3V2ZWF1X2Nv
bm5fYXRvbShjb25uZWN0b3ItPnN0YXRlKTsKKwllbHNlCisJCWFybWMgPSAmbnZfY29ubmVjdG9y
LT5wcm9wZXJ0aWVzX3N0YXRlOwogCiAJLyogSW5pdCBEVkktSSBzcGVjaWZpYyBwcm9wZXJ0aWVz
LiAqLwogCWlmIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RP
Ul9EVklJKQpAQCAtNzQ5LDkgKzc2Myw5IEBAIHN0YXRpYyBpbnQKIG5vdXZlYXVfY29ubmVjdG9y
X3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJICAgICAg
IHN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3BlcnR5LCB1aW50NjRfdCB2YWx1ZSkKIHsKLQlzdHJ1
Y3Qgbm91dmVhdV9jb25uX2F0b20gKmFzeWMgPSBub3V2ZWF1X2Nvbm5fYXRvbShjb25uZWN0b3It
PnN0YXRlKTsKIAlzdHJ1Y3Qgbm91dmVhdV9jb25uZWN0b3IgKm52X2Nvbm5lY3RvciA9IG5vdXZl
YXVfY29ubmVjdG9yKGNvbm5lY3Rvcik7CiAJc3RydWN0IG5vdXZlYXVfZW5jb2RlciAqbnZfZW5j
b2RlciA9IG52X2Nvbm5lY3Rvci0+ZGV0ZWN0ZWRfZW5jb2RlcjsKKwlzdHJ1Y3Qgbm91dmVhdV9j
b25uX2F0b20gKmFzeWMgPSAmbnZfY29ubmVjdG9yLT5wcm9wZXJ0aWVzX3N0YXRlOwogCXN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlciA9IHRvX2RybV9lbmNvZGVyKG52X2VuY29kZXIpOwogCWlu
dCByZXQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29u
bmVjdG9yLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5oCmlu
ZGV4IGRlOTU4ODQyMDg4NC4uZGU4NGZiNDcwOGM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmgKQEAgLTExOCw2ICsxMTgsMTIgQEAgc3RydWN0IG5vdXZl
YXVfY29ubmVjdG9yIHsKICNpZmRlZiBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUCiAJc3Ry
dWN0IG5vdXZlYXVfYmFja2xpZ2h0ICpiYWNrbGlnaHQ7CiAjZW5kaWYKKwkvKgorCSAqIE91ciBj
b25uZWN0b3IgcHJvcGVydHkgY29kZSBleHBlY3RzIGEgbm91dmVhdV9jb25uX2F0b20gc3RydWN0
CisJICogZXZlbiBvbiBwcmUtbnY1MCB3aGVyZSB3ZSBkbyBub3Qgc3VwcG9ydCBhdG9taWMuIFRo
aXMgZW1iZWRkZWQKKwkgKiB2ZXJzaW9uIGdldHMgdXNlZCBpbiB0aGUgbm9uIGF0b21pYyBtb2Rl
c2V0IGNhc2UuCisJICovCisJc3RydWN0IG5vdXZlYXVfY29ubl9hdG9tIHByb3BlcnRpZXNfc3Rh
dGU7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqbm91dmVh
dV9jb25uZWN0b3IoCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
