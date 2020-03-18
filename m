Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0019758D
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C9A6E1C0;
	Mon, 30 Mar 2020 07:22:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FC56E260
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TOKpkDx1+1S5gT8u85nuwajZFgWwJ6Fhafzgm2jG6Zg=;
 b=hoYYWEfaa/RcWrVeUhTy2pSYlH/Dw0D1wy+f02eboLAL30w1jjDUhLmcaf4s35+uOkprQM
 37mb+tmaH4sCmrZlug04YeZWuOVFV4SxGf3lyatUqoWBNWu9nJdlFLeeMIvfFrOjTGetQ8
 dN7c4masUYw6tLqY5GrAxIEmOiUn2og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-mxb62zmLO5OAnbbMfQwoaw-1; Tue, 17 Mar 2020 20:42:30 -0400
X-MC-Unique: mxb62zmLO5OAnbbMfQwoaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D2F8014CE;
 Wed, 18 Mar 2020 00:42:27 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9D760BE0;
 Wed, 18 Mar 2020 00:42:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:40:57 -0400
Message-Id: <20200318004159.235623-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: [Nouveau] [PATCH 0/9] drm/nouveau: Introduce CRC support for gf119+
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Ben Skeggs <bskeggs@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TnZpZGlhIHJlbGVhc2VkIHNvbWUgZG9jdW1lbnRhdGlvbiBvbiBob3cgQ1JDIHN1cHBvcnQgd29y
a3Mgb24gdGhlaXIKR1BVcywgaG9vcmF5IQoKU286IHRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVu
dHMgc2FpZCBDUkMgc3VwcG9ydCBpbiBub3V2ZWF1LCBhbG9uZyB3aXRoCmFkZGluZyBzb21lIHNw
ZWNpYWwgZGVidWdmcyBpbnRlcmZhY2VzIGZvciBzb21lIHJlbGV2YW50IGlndC1ncHUtdG9vbHMK
dGVzdHMgdGhhdCB3ZSdsbCBiZSBzZW5kaW5nIGluIGp1c3QgYSBzaG9ydCBiaXQuCgpUaGlzIGFk
ZGl0aW9uYWxseSBhZGRzIGEgZmVhdHVyZSB0aGF0IFZpbGxlIFN5cmrDpGzDpCBjYW1lIHVwIHdp
dGg6IHZibGFuawp3b3Jrcy4gQmFzaWNhbGx5LCB0aGlzIGlzIGp1c3QgYSBnZW5lcmljIERSTSBp
bnRlcmZhY2UgdGhhdCBhbGxvd3MgZm9yCnNjaGVkdWxpbmcgaGlnaC1wcmlvcml0eSB3b3JrZXJz
IHRoYXQgc3RhcnQgb24gYSBnaXZlbiB2YmxhbmsgaW50ZXJydXB0LgpOb3RlIHRoYXQgd2hpbGUg
d2UncmUgY3VycmVudGx5IG9ubHkgdXNpbmcgdGhpcyBpbiBub3V2ZWF1LCBJbnRlbCBoYXMKcGxh
bnMgdG8gdXNlIHRoaXMgZm9yIGk5MTUgYXMgd2VsbCAoaGVuY2Ugd2h5IHRoZXkgY2FtZSB1cCB3
aXRoIGl0ISkuCgpBbnl3YXktd2VsY29tZSB0byB0aGUgZnV0dXJlISA6KQoKTHl1ZGUgUGF1bCAo
OCk6CiAgZHJtL25vdXZlYXUva21zL252NTAtOiBVbnJvbGwgZXJyb3IgY2xlYW51cCBpbiBudjUw
X2hlYWRfY3JlYXRlKCkKICBkcm0vbm91dmVhdS9rbXMvbnYxNDAtOiBEb24ndCBtb2RpZnkgZGVw
dGggaW4gc3RhdGUgZHVyaW5nIGF0b21pYwogICAgY29tbWl0CiAgZHJtL25vdXZlYXUva21zL252
NTAtOiBGaXggZGlzYWJsaW5nIGRpdGhlcmluZwogIGRybS9ub3V2ZWF1L2ttcy9udjUwLTogcy9o
YXJtL2FybWgvZwogIGRybS9ub3V2ZWF1L2ttcy9udjE0MC06IFRyYWNrIHduZHcgbWFwcGluZ3Mg
aW4gbnY1MF9oZWFkX2F0b20KICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IEV4cG9zZSBudjUwX291
dHBfYXRvbSBpbiBkaXNwLmgKICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IE1vdmUgaGFyZC1jb2Rl
ZCBvYmplY3QgaGFuZGxlcyBpbnRvIGhlYWRlcgogIGRybS9ub3V2ZWF1L2ttcy9udmQ5LTogQWRk
IENSQyBzdXBwb3J0CgpWaWxsZSBTeXJqw6Rsw6QgKDEpOgogIGRybS92Ymxhbms6IEFkZCB2Ymxh
bmsgd29ya3MKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jICAgICAgICAgICAgICAgIHwg
MzIyICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jICAg
ICB8ICAyNSArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvS2J1aWxkICAgICB8
ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9hdG9tLmggICAgIHwgIDIx
ICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmUuaCAgICAgfCAgIDQgKwog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZTkwN2QuYyB8ICAgMyArCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jb3JlOTE3ZC5jIHwgICAzICsKIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmVjMzdkLmMgfCAgIDMgKwogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZWM1N2QuYyB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9jcmMuYyAgICAgIHwgNzE2ICsrKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jcmMuaCAgICAgIHwgMTI1ICsrKysKIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NyYzkwN2QuYyAgfCAxMzkgKysrKwogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjYzM3ZC5jICB8IDE1MyArKysrKwogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICB8ICA2NSArLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5oICAgICB8ICAyNCArCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oYW5kbGVzLmggIHwgIDE2ICsKIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyAgICAgfCAxNDIgKysrLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvaGVhZC5oICAgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvaGVhZDkwN2QuYyB8ICAxNCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvaGVhZGMzN2QuYyB8ICAyNyArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvaGVhZGM1N2QuYyB8ICAyMCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvd25kdy5jICAgICB8ICAxNSArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kaXNwbGF5LmMgICB8ICA2MCArLQogaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oICAgICAgICAg
ICAgICAgICAgICB8ICAzNCArCiAyNCBmaWxlcyBjaGFuZ2VkLCAxODIxIGluc2VydGlvbnMoKyks
IDEzMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9jcmMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2NyYy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvY3JjOTA3ZC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjYzM3ZC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGFuZGxlcy5oCgotLSAKMi4yNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
