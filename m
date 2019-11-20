Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC651040F5
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 17:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF16E8D1;
	Wed, 20 Nov 2019 16:39:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C2D6E8B4
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 16:39:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t1so608553wrv.4
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 08:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=/OHSU0fY9M2wF7Dch2vz0TnbVEHM5EwSW33Sj289Ves=;
 b=YWLFcgsIBxrB0neiaNIJQk1v2JPU05fzszikmigpdPIehf6luVDW+OXsWoHWvufqFI
 esLaUzbNTRdAlaL0RNALInmdvD+mCjQbDlyiKx7AgLtb55DcOrcEVbEcBLcVzRykrp5p
 140ZR1p6Fs1o2DLU/hNPh2fU6C/LYIgs0DKo2GeaDnHIzRul9vClkzmRh4eLQAfR6tZ7
 YXPzXIUSMP8TmEPedMmfo+VF7WnZm2fU4uWUSba6kl0W0a/V0Xvv7ytf5cApi6RCaNnr
 2RzjCIVdfwWGUv20fI34/rR6jR1h8UsqXc4NoQobMLypCi1RTl6m//3PVTV1bH8ejikY
 rlxQ==
X-Gm-Message-State: APjAAAUSXzUbDeV+ogSPHE1swhipl7ffibuV24cS6IYpYovd8X8aN0/t
 WwnQdVTdfdGTZRL494uQUEiKGA==
X-Google-Smtp-Source: APXvYqxVoHzP5vhF6LkCRi1Hwy3MgV40SQo6RqYoQ3S2Jy5cY6Mt6b3tlm1v83jfAcRsfCuT8TB8DQ==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr4449297wrr.214.1574267942842; 
 Wed, 20 Nov 2019 08:39:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x205sm7917798wmb.5.2019.11.20.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:39:01 -0800 (PST)
Date: Wed, 20 Nov 2019 17:39:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191120163900.GP30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20191120133619.11415-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133619.11415-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/OHSU0fY9M2wF7Dch2vz0TnbVEHM5EwSW33Sj289Ves=;
 b=VkAzDB4ht07A3g+rZWhLc3RvpxR3tanWxlh0EvxiYekr8nCSPHmUlZ/BUMxKCU6BIR
 9nh+QUHzT2vPnAIxSCHtGSFt+oUe6g7QT00ypWhXOjhdXfvmeBgEVseJPixTskmTqIIY
 sfVoKDB/u0Wor54YoTcwiD3ksN/S9/tvZcGZQ=
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix Kconfig indentation
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzY6MTlQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmln
Cj4gaW5kZXggMzU1OGRmMDQzNTkyLi45Yzk5MDI2NmU4NzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcKPiBAQCAtMiw3ICsyLDcgQEAKPiAgY29uZmlnIERSTV9OT1VWRUFVCj4gIAl0cmlz
dGF0ZSAiTm91dmVhdSAoTlZJRElBKSBjYXJkcyIKPiAgCWRlcGVuZHMgb24gRFJNICYmIFBDSSAm
JiBNTVUKPiAtICAgICAgICBzZWxlY3QgRldfTE9BREVSCj4gKwlzZWxlY3QgRldfTE9BREVSCj4g
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCXNlbGVjdCBEUk1fVFRNCj4gIAlzZWxlY3QgQkFD
S0xJR0hUX0NMQVNTX0RFVklDRSBpZiBEUk1fTk9VVkVBVV9CQUNLTElHSFQKPiAtLSAKPiAyLjE3
LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
