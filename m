Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365312C573C
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 15:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D796E969;
	Thu, 26 Nov 2020 14:39:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5C16E967
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606401590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpqWSB7NnZqZxvWvQRMJ/ZSDMF0RiyRDqsGOgCChW4c=;
 b=UY1W5nHxwQMEzb5I7Me+wTT4hyuTwy63Ow9SwbGgVNFe1JUtfA/S7Qs7oRDqnTsmz0Becx
 I7H0XE6bmLt/kfYgxLCBvmaJV51p/4XNSiUCsvBRChaIK84fZ9Xtr3czAJsvea392x2Avt
 fUpaNSucdFNLfxYODKjbyT851PIXxhY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-92YT4g01Nba_02vJqCLULg-1; Thu, 26 Nov 2020 09:39:46 -0500
X-MC-Unique: 92YT4g01Nba_02vJqCLULg-1
Received: by mail-qv1-f71.google.com with SMTP id cu18so1373330qvb.17
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 06:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xpqWSB7NnZqZxvWvQRMJ/ZSDMF0RiyRDqsGOgCChW4c=;
 b=JVL9MAcPZ4+xelDB13qtzFEk07N99byhxrtStRtSyC/3yxbHEUGhdRLiLq2gPZUWiP
 hzGiMItTb/wBp5lMSd2xEr8HG8IITuzwLqUa4e3pVlDzdkUW/zS4PGztZo4TK4yUByry
 T94lvYgpwvqvVfdRHSPDAMbQvHp3N0a63wyOIVTW3F3P8pLyX/7VrOJ7hoaUkUhKCBm9
 HIktJn/Gpz5kdKeTcYZfcf+oaeTCeBogadYbhPhyznmKQrBmPvghGUqdkavY6atdS7uJ
 kty6RG8370d/3+YOrmuPKX8MNw9CY29mfB6fIwkhtbkfgXGmiql2OyvYmS6GFb6NacvO
 mwkA==
X-Gm-Message-State: AOAM530SOl7t65KRh/KRGiOW7amygg14VlwjUCg+jBN400hSUh2/BVkg
 LkaiZacHB2CVtNeOy5HC2dSKrXviGxf1I4Sg1d3SE/BLniJSDDGL52u2R+uHALGpNexy7Uh9pxy
 o44Yh+KzqTExqsHqmDAPDWxfsMXvDjfiEIy05oftknA==
X-Received: by 2002:a0c:f9c8:: with SMTP id j8mr3468056qvo.17.1606401586284;
 Thu, 26 Nov 2020 06:39:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR1JF7FIINc7tTLChbYKzb2vX6ZEtJWD97ICKhSMEWUljZVA3uEq0NJ3kJXB3IaCbM64xhh2G5UxlhrfWxkEA=
X-Received: by 2002:a0c:f9c8:: with SMTP id j8mr3468041qvo.17.1606401586030;
 Thu, 26 Nov 2020 06:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20201126131141.15060-1-christian.koenig@amd.com>
In-Reply-To: <20201126131141.15060-1-christian.koenig@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 26 Nov 2020 15:39:35 +0100
Message-ID: <CACO55tukOurshAjRTyyrzCj16FNXtp5QjvMBWP_rcxHG3DoW2A@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau: make sure ret is initialized in
 nouveau_ttm_io_mem_reserve
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gVGh1LCBO
b3YgMjYsIDIwMjAgYXQgMjoxMSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHdhc24ndCBpbml0aWFsaXplZCBmb3Ig
cHJlIE5WNTAgaGFyZHdhcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gUmVwb3J0ZWQtYW5kLVRlc3RlZC1ieTogTWFyayBI
b3Vuc2NoZWxsIDxkbWFya2hAY2ZsLnJyLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBp
bmRleCA3YWE0Mjg2Nzg0YWUuLjQyMjkyYjNhNmViOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMKPiBAQCAtMTEzNSw4ICsxMTM1LDggQEAgbm91dmVhdV90dG1faW9fbWVt
X3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fcmVzb3VyY2Ug
KnJlZykKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZWctPmJ1cy5vZmZzZXQgPSBoYW5kbGU7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gMDsKPiAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICByZXQgPSAwOwo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAg
ICAgIHJldCA9IC1FSU5WQUw7Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
