Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064E341FAE
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCA76EA3C;
	Fri, 19 Mar 2021 14:36:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585476E994
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a7so8267467ejs.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYV9tdkZp1J1ptXQ7wy9Bkml0mtc5KsRXNGrscVW51o=;
 b=YO3T1K4fRrjI5zyKPPMhF0ZWIxUKyEN/v8X23V4Uu+3vH3IBJ2xSrRG51/I4+b3IOC
 M4HyW9W6GnYd1DFAUk9nF11YTW90u6BZiMJvVbarWtiuB2NL2P4gcbpxLqpfS2Ax4U/+
 3E2TEJ5ahykRuBF53GARnAmr1kkuiUjPhaAsQNht/0SpU3WqnpkPxGOBGQE5VsMq2NHe
 TiN2SHUpSpRaJJVJAsSut/9R4g+uBBjR72u37lxqDMP9v1Nxc75B2z1T3laAIWJfCnRz
 MpZ41NouSa716oGR6beChpj4CO2s8K8Byyi/RuEAH5V79IHxrI+4y+lhNebbaSZU04R+
 SSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYV9tdkZp1J1ptXQ7wy9Bkml0mtc5KsRXNGrscVW51o=;
 b=m77HmfmLLykOITC4rDzAutz0MO490l4z9S1djBbs8oegqLGweZ3n+TenZG4ipc3Y+X
 nppR6+TvqIj2rCYY9WkD46U2pEorYUKX//sC4ncOi/WgHrz0BiBtX4vzFaHGQEtgmN3d
 o1PCK8yscPONR3kLWel1lgbISJgfw8X95+uhNHzaT7KyfSJOqoB+xgaFzqJocI/WhSD7
 ac4tN395Tiwi2tA2FlB3lJeOFZQX5RpLVkexDT492bO3U///4Kx5EYoS8EIedhs0tKK3
 tC/YKU/UCG9o4gZ+z4cJxKaf6JxTRSFedF/i+uPjyZzL4j7Y1+kxEAd2qxUZgXr5rjDD
 gyuw==
X-Gm-Message-State: AOAM530Dc6rPfm5/3Q7F2s9zzz1cwo7O7bdejMxIRogQxOeLWAeVSx7m
 3VhtQ42eVkb4loj2cjX3bImtCA==
X-Google-Smtp-Source: ABdhPJxL5an5eBZ72SbM5yDAwYkHBc6fdqf/KsOB8xAPf+lniUY6pKqQ4xw/bVWoZSkHHhXMyt7nGQ==
X-Received: by 2002:a17:906:ad85:: with SMTP id
 la5mr2964707ejb.37.1616142271941; 
 Fri, 19 Mar 2021 01:24:31 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:09 +0000
Message-Id: <20210319082428.3294591-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [RESEND 00/19] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jeremy Kolb <jkolb@brandeis.edu>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKClRoaXMgaXMgYSByZXNlbmQgb2YgdGhl
IHJlbWFpbmluZyBwYXRjaGVzLgoKQWxsIG9mIHRoZXNlIHBhdGNoZXMgaGF2ZSBiZWVuIHNlbnQg
YmVmb3JlLgoKTGVlIEpvbmVzICgxOSk6CiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9p
bml0OiBEZW1vdGUgb2J2aW91cyBhYnVzZSBvZiBrZXJuZWwtZG9jCiAgZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0JwogIGRybS9tc20vZHAvZHBf
ZGlzcGxheTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnaHBkJwogIGluY2x1ZGU6IGRybTogZHJt
X2F0b21pYzogTWFrZSB1c2Ugb2YgJ25ld19wbGFuZV9zdGF0ZScKICBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi92b2x0L2drMjBhOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwogICAg
aGVhZGVycwogIGRybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3M6IE1vdmUgc29tZSBs
YXJnZSB2YXJpYWJsZXMgZnJvbSB0aGUKICAgIHN0YWNrIHRvIHRoZSBoZWFwCiAgZHJtL2FtZC9k
aXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjczogUmVtb3ZlIHNvbWUgbGFyZ2UgdmFyaWFibGVzIGZy
b20KICAgIHRoZSBzdGFjawogIGRybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJj
ZTogTWFrZSBsb2NhbCBmdW5jdGlvbnMgc3RhdGljCiAgZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUv
Z3IvZ2YxMDA6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jCiAgICBoZWFkZXIKICBk
cm0vbm91dmVhdS9ub3V2ZWF1X2JvOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlcyAnZGV2JwogIGRy
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheTogUmVtb3ZlIHNldCBidXQgdW51c2VkIHZhcmlhYmxl
ICd3aWR0aCcKICBkcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjOiBEZW1vdGUgbm9uLWNvbmZvcm1p
bmcga2VybmVsLWRvYyBoZWFkZXJzCiAgZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcDogUmVtb3Zl
IHVudXNlZCB2YXJpYWJsZSAncmV0JyBmcm9tIGZ1bmN0aW9uCiAgICByZXR1cm5pbmcgdm9pZAog
IGRybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkOiBNYWtlIGxvY2FsIGZ1bmN0aW9uICdoZWFk
YzU3ZF9vbHV0JwogICAgc3RhdGljCiAgZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5OiBSZW1vdmUg
c3VwZXJmbHVvdXMgcHJvdG90eXBlIGZvciBsb2NhbAogICAgc3RhdGljIGZ1bmN0aW9ucwogIGRy
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3A6IEluY2x1ZGUgaGVhZGVyIGNvbnRhaW5pbmcgb3VyIHBy
b3RvdHlwZXMKICBkcm0vbm91dmVhdS9ub3V2ZWF1X2lvYzMyOiBGaWxlIGhlYWRlcnMgYXJlIG5v
dCBnb29kIGNhbmRpZGF0ZXMgZm9yCiAgICBrZXJuZWwtZG9jCiAgZHJtL25vdXZlYXUvbm91dmVh
dV9zdm06IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ3JldCcgZnJvbSB2b2lkCiAgICBmdW5jdGlv
bgogIGRybS9ub3V2ZWF1L25vdXZlYXVfaW9jMzI6IERlbW90ZSBrZXJuZWwtZG9jIGFidXNlIHRv
IHN0YW5kYXJkIGNvbW1lbnQKICAgIGJsb2NrCgogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2FsY3MvZGNlX2NhbGNzLmMgIHwgMTE1NCArKysrKysrKystLS0tLS0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jIHwgICAxNiArLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgICAgICAgICAgIHwgICAgMyAtCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgICAgICAgfCAgICA0ICstCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICAgICAgfCAgIDEwICstCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgICAgICAgICAgfCAgICA0IC0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jICAgICB8ICAgIDggKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfaW9jMzIuYyAgICAgICB8ICAgIDQgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgICAgICAgICB8ICAgIDUgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252NTBfZGlzcGxheS5oICAgICAgICB8ICAgIDMgLQogLi4uL2dwdS9kcm0vbm91
dmVhdS9udmttL2VuZ2luZS9nci9nZjEwMC5jICAgIHwgICAgMiArLQogLi4uL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyAgIHwgIDIwNCArLS0KIC4uLi9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvdm9sdC9nazIwYS5jICB8ICAgIDQgKy0KIGluY2x1ZGUvZHJtL2Ry
bV9hdG9taWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKy0KIDE1IGZpbGVzIGNoYW5n
ZWQsIDY5MiBpbnNlcnRpb25zKCspLCA3MzQgZGVsZXRpb25zKC0pCgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpDYzogQmVuIFNrZWdn
cyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CkNjOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBKZXJlbXkgS29sYiA8amtvbGJAYnJhbmRlaXMuZWR1
PgpDYzogS3VvZ2VlIEhzaWVoIDxraHNpZWhAY29kZWF1cm9yYS5vcmc+CkNjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzog
bGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZwpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tIAoyLjI3LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
