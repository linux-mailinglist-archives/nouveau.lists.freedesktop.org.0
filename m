Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E834632B882
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0AC6E9B0;
	Wed,  3 Mar 2021 14:09:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1306E8F7
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id m1so6399024wml.2
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=DDM5R4xsGiTVpRIEPuVyLljyb6ERGlg1KlQqC4FxmUKm7EgZzmf3FUqCqwRnWSzS1M
 W1Jt8E+Xi1w8AAO3crFj2UNIosYF9a5C5S2xPLVYbdKOz4DNyidBnrZNgND5NXGIo82m
 MwolqE2yBrUUnTQZgwYF00WIuelEBzNqvX5BX16/ko2vetUGo9U2CNIOEW1iva5w9dQL
 DzKQexO8SiTvO2U2ipzDN5VfW8AFExyg6NFrMlYQ0qSEmUutSy3cpsMN39c5j9UJa9xm
 IMN58C0+q+YtF2ntzuUIWAwHfQ8+AGB8BtnY9hrIBv3Y9aGYwpn2ACZZVULICZMS4JQw
 3qrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=TghpLRknDtxPAE6OPBOVSvRplZrk8Hdg+GqDMAKitMDRBeacdTTGl6IXFujSynrtuC
 p6t/HQZtcUv7eoP+wRtiZVRwGVquPTUXKny4Y/0Z7DY/CTtI5XHH1aLnue7xKPHHuE0I
 9eodMsyM8a1Gtg6HxAq39pFVHo/WQaRdrU+/0CUUN/7OlROA8z5+Sx+Vsxfv2Bm7K/6S
 7ijinbrevR+mIvfBjt2UkhKCTfvf9cuJ/UKkH5aDUGbLo+oOFziPQgyyrrgWskHECN2Q
 xhYEK5geInJttZmECMG80Jt8bvFGvfi/xaaLHrOzswOSCwExGkHkbAzBG3uOFv068w4I
 O4mw==
X-Gm-Message-State: AOAM531I1SiqI39dT/bDZckKwFcl0osVGBDnDHslaZtnxy8WoP+aFzt3
 Caj/BTo6iXTGsBFsp18Bh6O4mX5k5uqiGQ==
X-Google-Smtp-Source: ABdhPJxHOaQh1gbCrDX6+3WvqrrtI5i+ZBikz6KzeCDd+omBFFvRiWkXx0KwkxwsaJwM1pEbK8z6vw==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr9320896wmc.133.1614779029145; 
 Wed, 03 Mar 2021 05:43:49 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:44 +0000
Message-Id: <20210303134319.3160762-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 18/53] drm/nouveau/nv50_display: Remove
 superfluous prototype for local static functions
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmM6MjUzMDoxOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKA
mG52NTBfZGlzcGxheV9maW5p4oCZCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnY1MF9kaXNwbGF5Lmg6MzY6Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1
MF9kaXNwbGF5X2ZpbmnigJkgd2FzIGhlcgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKA
mG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBoZXJlCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6MjU4MToxOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmG52
NTBfZGlzcGxheV9kZXN0cm954oCZIGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlvbgogSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Yzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6
IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBo
ZXJlCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCB8IDMgLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBf
ZGlzcGxheS5oCmluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCkBAIC0zMSw3ICszMSw0IEBACiAjaW5jbHVkZSAi
bm91dmVhdV9yZWcuaCIKIAogaW50ICBudjUwX2Rpc3BsYXlfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICopOwotdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqKTsK
LWludCAgbnY1MF9kaXNwbGF5X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKik7Ci12b2lkIG52NTBf
ZGlzcGxheV9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICopOwogI2VuZGlmIC8qIF9fTlY1MF9ESVNQ
TEFZX0hfXyAqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
