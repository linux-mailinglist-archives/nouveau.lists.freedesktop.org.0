Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE76CAA1
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 10:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7596E348;
	Thu, 18 Jul 2019 08:07:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713D06E33E
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 08:07:49 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p17so27557700wrf.11
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 01:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HwChMtygw8+OSUpmVifhTD7QBwLqitBMqOdVmDBOLiA=;
 b=MdXHgA3phx6XFBU3bZ6S1XDkr9KITTSruk6p/J1Az4e2oD1y7C9TOVPe1etsYsixde
 ku4Dw1Xx2T/OQuyc6/49HWppFhAbUolLkUhnBvAm51kiGPKHHve2qygULgFi9vtH3n3T
 1469/FVFH+PDLWhwAMOHAizxtUiBZrWlpXTw0qAcPRJ3Qx64onSF+UvI7hH+/xPs2Igy
 ryu2lKTtKgOejWuXBYHvyYE5+tXfWmiX0PkDyJ/7zUt5Ba4jfrGM5cbNVl5+pqdtBc+y
 GNkBxHjQrwBROnygbqLKC4yR5sa1ZXyLHnI6cXDsUB6Y02K+9mzn3uMaXt5dypuO34la
 dzSw==
X-Gm-Message-State: APjAAAWF+vknHB1rfjsa/nRygeX6QZCzxrDzIF9bo59jUQ5W0mrgegil
 hqAUXulcj2tAGRgzAWZL6JMSdZYd6jg=
X-Google-Smtp-Source: APXvYqwTxLOCETMmdNQXaJwAjO+KBxKQmlME9uCt/yc619CAHbJJjxk/ByeXUlumr7/zlF0gWNbnWQ==
X-Received: by 2002:adf:8364:: with SMTP id 91mr47853768wrd.13.1563437267786; 
 Thu, 18 Jul 2019 01:07:47 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm28354532wrv.90.2019.07.18.01.07.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:07:47 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Jul 2019 10:07:40 +0200
Message-Id: <20190718080741.3147-4-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718080741.3147-1-mmenzyns@redhat.com>
References: <20190718080741.3147-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 3/4] gpio: check the gpio function 16 in the
 power check as well
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWRkZWQgR1BJTyBpcyAiVGhlcm1hbCBhbmQgRXh0ZXJuYWwgUG93ZXIgRGV0ZWN0Ii4gSXQncyB1
bmNlcnRhaW4gaWYgdGhpcwpHUElPIGlzIHNldCBvbiBHUFUgaW5pdGlhbGl6YXRpb24gb3Igb25s
eSBpZiBhIGNoYW5nZSBpcyBkZXRlY3RlZCBieSB0aGUKR1BVIGF0IHJ1bnRpbWUuCgpUaGlzIEdQ
SU8gY2FuIGJlIGZvdW5kIGluIFJhbmtpbmUgYW5kIEN1cmllIGFuZCByYXJlbHkgb24gVGVzbGEg
R1BVcwpWQklPUy4KClVudGVzdGVkLCB3cm90ZSBhY2NvcmRpbmcgdG8gZG9jdW1lbnRhdGlvbi4K
ClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVuenluc2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0K
IGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggfCAxICsKIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9u
dmttL3N1YmRldi9iaW9zL2dwaW8uaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
Ymlvcy9ncGlvLmgKaW5kZXggYTcwZWM5ZTguLmZjMmI1ZmIwIDEwMDY0NAotLS0gYS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCisrKyBiL2RybS9ub3V2ZWF1L2lu
Y2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKQEAgLTUsNiArNSw3IEBAIGVudW0gZGNiX2dw
aW9fZnVuY19uYW1lIHsKIAlEQ0JfR1BJT19QQU5FTF9QT1dFUiA9IDB4MDEsCiAJRENCX0dQSU9f
RkFOID0gMHgwOSwKIAlEQ0JfR1BJT19UVkRBQzAgPSAweDBjLAorCURDQl9HUElPX1RIRVJNX0VY
VF9QT1dFUl9FVkVOVCA9IDB4MTAsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKIAlEQ0JfR1BJ
T19GQU5fU0VOU0UgPSAweDNkLAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1cgPSAweDc5LApkaWZm
IC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYwppbmRleCA3MjI4OWUyZS4uY2M1NjYzN2YgMTAwNjQ0
Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCisrKyBiL2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCkBAIC0xODQsNiArMTg0LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGdwaW9fcmVzZXRfaWRzW10gPSB7CiB9OwogCiBzdGF0
aWMgZW51bSBkY2JfZ3Bpb19mdW5jX25hbWUgcG93ZXJfY2hlY2tzW10gPSB7CisJRENCX0dQSU9f
VEhFUk1fRVhUX1BPV0VSX0VWRU5ULAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1csCiB9OwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
