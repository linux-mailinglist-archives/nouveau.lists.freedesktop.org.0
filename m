Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162C8DFD9
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 23:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23F6E848;
	Wed, 14 Aug 2019 21:31:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F646E848
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so443046wrr.8
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhvDIcAWfosZBJhY+0+tJdL27Lzyx+m3Z571YGmGrMU=;
 b=rnw6ni1EPwvnRSuSiVicIQ4OMZMi0vTx3peIf6MifRrXuV0pcLHM3/QC45pKAfwW3l
 mydaR5u5MteBSi/KGpc0pimdWvHqJKUHMsjGVfaXz0yo193yVl7uTGSKImP9hcHQBnWJ
 oS1C1h41MbHUkCmBZU4xXV+v+YRMBY6qbYgj20TGbI8ddygFDGBXA3gweDPcdRzg8Fmz
 VS4S1ZGvtCTDPI7fm57W/0dtBt0WgwbpP3BOyl5RORpczJ2PBK3S1qjSiUXJM+kYpcdS
 bSx/Hp5fYC9OA7OLd8BX6tRPVnOjMaFDEgIx+caYkq9wFlWb9ysMbvWqxqCbfJ9FsU+R
 /MjQ==
X-Gm-Message-State: APjAAAVl/AdTxI6953eEsWfUNHqZYGbwTHOa/IUiRo1abjY8zaoAD7Qz
 9pGqxQFxB6ZBLwVb5YDfSxZL+Q==
X-Google-Smtp-Source: APXvYqzpILgvWyO/axbBU+RuIXy2MhZX3baBIQN5meB2TU+nSw73f26dSGUM9WN8J6xOSH+pbpo82A==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr1601044wrs.200.1565818285969; 
 Wed, 14 Aug 2019 14:31:25 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:25 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 14 Aug 2019 23:31:14 +0200
Message-Id: <20190814213118.28473-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 3/7] Revert "ACPI / OSI: Add OEM _OSI strings to
 disable NVidia RTD3"
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

VGhpcyByZXZlcnRzIGNvbW1pdCA5MjUxYTcxZGI2MmNhOWNjN2U3Y2YzNjQyMTg2MTBiMGYwMThj
MjkxLgoKVGhpcyB3YXMgbmV2ZXIgZGlzY3Vzc2VkIHdpdGggYW55Ym9keSBOb3V2ZWF1IHJlbGF0
ZWQgYW5kIHdlIHdvdWxkIGhhdmUgTkFDS2VkCnRoaXMgY2hhbmdlIGltbWVkaWF0ZWx5LgoKV2Ug
aGF2ZSBhIGJldHRlciB3b3JrYXJvdW5kLCB3aGljaCBtYWtlcyBpdCBhY3R1YWxseSB3b3JrIHdp
dGggTm91dmVhdS4gTm8gaWRlYQp3aHkgdGhlIGNvbW1lbnQgbWVudGlvbnMgdGhlIE52aWRpYSBk
cml2ZXIgYW5kIGFzc3VtZXMgaXQgZ2l2ZXMgYW55IHdlaWdodCB0bwp0aGUgcmVhc29uaW5nLi4u
LiB3ZSBkb24ndCBjYXJlIGFib3V0IG91dCBvZiB0cmVlIGRyaXZlcnMuCgpOb3V2ZWF1IGRvZXMg
c3VwcG9ydCBSVEQzLCBidXQgd2UgaGFkIHNvbWUgaXNzdWVzIHdpdGggdGhhdC4gQW5kIHdlIGV2
ZW4gaGF2ZQphIGJldHRlciBmaXggZm9yIHRoaXMgaXNzdWUuIEFsc28sIGNhbiB3ZSBfcGxlYXNl
XyBkbyBpdCBpbiBhIHdheSB3b3J0aHkgb2YgYW4KdXBzdHJlYW0gY29tbXVuaXR5IHRoZSBuZXh0
IHRpbWU/CgpJZiBzb21lIGRpc3RyaWJ1dGlvbiBmZWVscyBsaWtlIHRoZXkgaGF2ZSB0byBwbGVh
c2UgY29tcGFuaWVzIG5vdCB3YW50aW5nIHRvCmJlIHBhcnQgb2YgdGhlIGxpbnV4IGNvbW11bml0
eSwgcGxlYXNlIGRvIHNvIGRvd25zdHJlYW0gYW5kIGRvbid0IHRyeSB0byBwdXNoCnNvbWV0aGlu
ZyBsaWtlIHRoaXMgdXBzdHJlYW0uCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJi
c3RAcmVkaGF0LmNvbT4KQ0M6IEFsZXggSHVuZyA8YWxleC5odW5nQGNhbm9uaWNhbC5jb20+CkND
OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+CkNDOiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDQzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KQ0M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2Fj
cGkvb3NpLmMgfCA5IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL29zaS5jIGIvZHJpdmVycy9hY3BpL29zaS5jCmluZGV4
IDU2Y2M5NWI2YjcyNC4uZjVkNTU5YTJmZjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvb3Np
LmMKKysrIGIvZHJpdmVycy9hY3BpL29zaS5jCkBAIC00NCwxNSArNDQsNiBAQCBvc2lfc2V0dXBf
ZW50cmllc1tPU0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2luaXRkYXRhID0gewogCXsiUHJvY2Vz
c29yIERldmljZSIsIHRydWV9LAogCXsiMy4wIF9TQ1AgRXh0ZW5zaW9ucyIsIHRydWV9LAogCXsi
UHJvY2Vzc29yIEFnZ3JlZ2F0b3IgRGV2aWNlIiwgdHJ1ZX0sCi0JLyoKLQkgKiBMaW51eC1EZWxs
LVZpZGVvIGlzIHVzZWQgYnkgQklPUyB0byBkaXNhYmxlIFJURDMgZm9yIE5WaWRpYSBncmFwaGlj
cwotCSAqIGNhcmRzIGFzIFJURDMgaXMgbm90IHN1cHBvcnRlZCBieSBkcml2ZXJzIG5vdy4gIFN5
c3RlbXMgd2l0aCBOVmlkaWEKLQkgKiBjYXJkcyB3aWxsIGhhbmcgd2l0aG91dCBSVEQzIGRpc2Fi
bGVkLgotCSAqCi0JICogT25jZSBOVmlkaWEgZHJpdmVycyBvZmZpY2lhbGx5IHN1cHBvcnQgUlRE
MywgdGhpcyBfT1NJIHN0cmluZ3MgY2FuCi0JICogYmUgcmVtb3ZlZCBpZiBib3RoIG5ldyBhbmQg
b2xkIGdyYXBoaWNzIGNhcmRzIGFyZSBzdXBwb3J0ZWQuCi0JICovCi0JeyJMaW51eC1EZWxsLVZp
ZGVvIiwgdHJ1ZX0sCiB9OwogCiBzdGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJp
bmcgaW50ZXJmYWNlLCB1MzIgc3VwcG9ydGVkKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
