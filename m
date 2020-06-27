Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB15720C3C4
	for <lists+nouveau@lfdr.de>; Sat, 27 Jun 2020 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625AF6E182;
	Sat, 27 Jun 2020 19:47:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C2F6E17B
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jun 2020 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593287230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06AlwKVkuVI6ElbE+J2x+1IfIbX5X762VJ0OLmfYmJ4=;
 b=Bx/ND1RfD9Bbi+oUl/f3Eg1LZUre0sSHef37wv39WoUNtFNoo1kd5p2SgnZnQ8BHkgNESH
 zisGGcZcAomI0MQ37jRp/shMILpXVFD5h5VNDFjCwHifFnI2cgrcls0V5k/UKFYdoooqgY
 Qa+GfiRouwDURYdvS4I8RCXIehEa1gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-arU-Ip_dOiihnId6YAtiWA-1; Sat, 27 Jun 2020 15:47:08 -0400
X-MC-Unique: arU-Ip_dOiihnId6YAtiWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E90464;
 Sat, 27 Jun 2020 19:47:06 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-223.rdu2.redhat.com
 [10.10.112.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C65A7930D;
 Sat, 27 Jun 2020 19:47:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Sat, 27 Jun 2020 15:46:50 -0400
Message-Id: <20200627194657.156514-3-lyude@redhat.com>
In-Reply-To: <20200627194657.156514-1-lyude@redhat.com>
References: <20200627194657.156514-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: [Nouveau] [RFC v8 2/9] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_off()
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBnb3QgbWUgY29uZnVzZWQgZm9yIGEgYml0IHdoaWxlIGxvb2tpbmcgb3ZlciB0aGlzIGNv
ZGU6IEkgaGFkIGJlZW4KcGxhbm5pbmcgb24gYWRkaW5nIHNvbWUgYmxvY2tpbmcgZnVuY3Rpb24g
Y2FsbHMgaW50byB0aGlzIGZ1bmN0aW9uLCBidXQKc2VlaW5nIHRoZSBpcnFzYXZlL2lycXJlc3Rv
cmUgdmFyaWFudHMgb2Ygc3Bpbl8odW4pbG9jaygpIGRpZG4ndCBtYWtlIGl0CnZlcnkgY2xlYXIg
d2hldGhlciBvciBub3QgdGhhdCB3b3VsZCBhY3R1YWxseSBiZSBzYWZlLgoKU28gSSB3ZW50IGFo
ZWFkIGFuZCByZXZpZXdlZCBldmVyeSBzaW5nbGUgZHJpdmVyIGluIHRoZSBrZXJuZWwgdGhhdCB1
c2VzCnRoaXMgZnVuY3Rpb24sIGFuZCB0aGV5IGFsbCBmYWxsIGludG8gdGhyZWUgY2F0ZWdvcmll
czoKCiogRHJpdmVyIHByb2JlIGNvZGUKKiAtPmF0b21pY19kaXNhYmxlKCkgY2FsbGJhY2tzCiog
TGVnYWN5IG1vZGVzZXR0aW5nIGNhbGxiYWNrcwoKQWxsIG9mIHRoZXNlIHdpbGwgYmUgZ3VhcmFu
dGVlZCB0byBoYXZlIElSUXMgZW5hYmxlZCwgd2hpY2ggbWVhbnMgaXQncwpwZXJmZWN0bHkgc2Fm
ZSB0byBibG9jayBoZXJlLiBKdXN0IHRvIG1ha2UgdGhpbmdzIGEgbGl0dGxlIGxlc3MKY29uZnVz
aW5nIHRvIG90aGVycyBpbiB0aGUgZnV0dXJlLCBsZXQncyBzd2l0Y2ggb3ZlciB0bwpzcGluX2xv
Y2tfaXJxKCkvc3Bpbl91bmxvY2tfaXJxKCkgdG8gbWFrZSB0aGF0IGZhY3QgYSBsaXR0bGUgbW9y
ZQpvYnZpb3VzLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxh
bmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggY2U1YzFlMWQyOTk2My4u
ZTg5NWY1MzMxZmRiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC0xMjgzLDEzICsxMjgzLDEyIEBA
IHZvaWQgZHJtX2NydGNfdmJsYW5rX29mZihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0
IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZSwgKnQ7CiAKIAlrdGltZV90IG5vdzsKLQl1bnNp
Z25lZCBsb25nIGlycWZsYWdzOwogCXU2NCBzZXE7CiAKIAlpZiAoZHJtX1dBUk5fT04oZGV2LCBw
aXBlID49IGRldi0+bnVtX2NydGNzKSkKIAkJcmV0dXJuOwogCi0Jc3Bpbl9sb2NrX2lycXNhdmUo
JmRldi0+ZXZlbnRfbG9jaywgaXJxZmxhZ3MpOworCXNwaW5fbG9ja19pcnEoJmRldi0+ZXZlbnRf
bG9jayk7CiAKIAlzcGluX2xvY2soJmRldi0+dmJsX2xvY2spOwogCWRybV9kYmdfdmJsKGRldiwg
ImNydGMgJWQsIHZibGFuayBlbmFibGVkICVkLCBpbm1vZGVzZXQgJWRcbiIsCkBAIC0xMzI1LDcg
KzEzMjQsNyBAQCB2b2lkIGRybV9jcnRjX3ZibGFua19vZmYoc3RydWN0IGRybV9jcnRjICpjcnRj
KQogCQlkcm1fdmJsYW5rX3B1dChkZXYsIHBpcGUpOwogCQlzZW5kX3ZibGFua19ldmVudChkZXYs
IGUsIHNlcSwgbm93KTsKIAl9Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT5ldmVudF9s
b2NrLCBpcnFmbGFncyk7CisJc3Bpbl91bmxvY2tfaXJxKCZkZXYtPmV2ZW50X2xvY2spOwogCiAJ
LyogV2lsbCBiZSByZXNldCBieSB0aGUgbW9kZXNldCBoZWxwZXJzIHdoZW4gcmUtZW5hYmxpbmcg
dGhlIGNydGMgYnkKIAkgKiBjYWxsaW5nIGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMo
KS4gKi8KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
