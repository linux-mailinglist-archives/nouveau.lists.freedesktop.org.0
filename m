Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F78DFDE
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 23:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0E6E851;
	Wed, 14 Aug 2019 21:31:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00126E84F
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i63so511446wmg.4
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYZjU1RTDpOkzFDReluCSDSSmZ91Zx0fRKtSGoSAbAQ=;
 b=Vy8zHyX98prFyvvE5z/20tB2WZQoDAAbGg5Lf7MSYoemVQ7nsD9bG+CZNa7Q6FNJyL
 aaZnpXeUhGkIM6JmVGSJtHQRHuV0caCTJD14a8XSQVHYK8dbBDNbk5jtUsS1A04qB40r
 QpdkFoB0hziyVL40GuPLspG+q8XK8ulAK7ZCwqQUd821VETH/phc4yRimrMBXhEFl36V
 6mIu52N1QqSwaYP4d2TKC1tlFhcLhZNzWOVN4Nrl7bGI55eHucG0T8uE8srwRe34w8SO
 5k+s1OL1pPiN6NInZa1TD3gSG7IGvIuj4nvFTcpPD+98AwUNKuF3n+KvJCudlhlqaR3g
 DBhg==
X-Gm-Message-State: APjAAAUn2lRFCMPHjAbBF7kHej52jJFah7gzvmWU/VEyhaODqkJAtF2x
 s9VAnUI6qevkRgBfmx0DgFa8BA==
X-Google-Smtp-Source: APXvYqzNvd+OhowbMV5UPI7p1DFhfCV5EFIScUQVzbZ3KQZm996fQEnm0XDNrUvLBitBCCdEL8ugqA==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr884035wml.169.1565818284752; 
 Wed, 14 Aug 2019 14:31:24 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:24 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 14 Aug 2019 23:31:13 +0200
Message-Id: <20190814213118.28473-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable NVidia HDMI audio"
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA4ODc1MzJjYTdjYTU5ZmNmMDU0N2E3OTIxMTc1Njc5MTEyODAz
MGEzLgoKV2UgaGF2ZSBhIGJldHRlciBzb2x1dGlvbiBmb3IgdGhpczogYjUxNmVhNTg2ZDcxNwoK
QW5kIHNhbWUgYXMgd2l0aCB0aGUgbGFzdCBjb21taXQ6ICJOVmlkaWEgTGludXggZHJpdmVyIiB0
aGF0J3MgTm91dmVhdSwgYW55Cm91dCBvZiB0cmVlIGRyaXZlciBkb2VzIF9ub3RfIG1hdHRlci4g
QW5kIHdpdGggTm91dmVhdSBhbGwgb2YgdGhpcyB3b3JrcyBldmVuCnRob3VnaCBpdCByZXF1aXJl
ZCBhIHByb3BlciBmaXggZmlyc3QsIGJ1dCB3ZSBoYXZlIHRoYXQgbm93LgoKU2lnbmVkLW9mZi1i
eTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+CkNDOiBBbGV4IEh1bmcgPGFsZXgu
aHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29j
a2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ0M6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNDOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9hY3BpL29zaS5jIHwgOCAtLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL29zaS5jIGIvZHJp
dmVycy9hY3BpL29zaS5jCmluZGV4IDliMjBhYzRkNzlhMC4uNTZjYzk1YjZiNzI0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2FjcGkvb3NpLmMKKysrIGIvZHJpdmVycy9hY3BpL29zaS5jCkBAIC01Mywx
NCArNTMsNiBAQCBvc2lfc2V0dXBfZW50cmllc1tPU0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2lu
aXRkYXRhID0gewogCSAqIGJlIHJlbW92ZWQgaWYgYm90aCBuZXcgYW5kIG9sZCBncmFwaGljcyBj
YXJkcyBhcmUgc3VwcG9ydGVkLgogCSAqLwogCXsiTGludXgtRGVsbC1WaWRlbyIsIHRydWV9LAot
CS8qCi0JICogTGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8gaXMgdXNlZCBieSBCSU9TIHRvIHBv
d2VyIG9uIE5WaWRpYSdzIEhETUkKLQkgKiBhdWRpbyBkZXZpY2Ugd2hpY2ggaXMgdHVybmVkIG9m
ZiBmb3IgcG93ZXItc2F2aW5nIGluIFdpbmRvd3MgT1MuCi0JICogVGhpcyBwb3dlciBtYW5hZ2Vt
ZW50IGZlYXR1cmUgb2JzZXJ2ZWQgb24gc29tZSBMZW5vdm8gVGhpbmtwYWQKLQkgKiBzeXN0ZW1z
IHdoaWNoIHdpbGwgbm90IGJlIGFibGUgdG8gb3V0cHV0IGF1ZGlvIHZpYSBIRE1JIHdpdGhvdXQK
LQkgKiBhIEJJT1Mgd29ya2Fyb3VuZC4KLQkgKi8KLQl7IkxpbnV4LUxlbm92by1OVi1IRE1JLUF1
ZGlvIiwgdHJ1ZX0sCiB9OwogCiBzdGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJp
bmcgaW50ZXJmYWNlLCB1MzIgc3VwcG9ydGVkKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
