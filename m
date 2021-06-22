Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D5C3B0049
	for <lists+nouveau@lfdr.de>; Tue, 22 Jun 2021 11:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838986E461;
	Tue, 22 Jun 2021 09:32:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1206E45E;
 Tue, 22 Jun 2021 09:32:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q14so1412651eds.5;
 Tue, 22 Jun 2021 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LOCSnm/N1pBHltn95vUZhkchMq85yLIfAmB1PF+x18Q=;
 b=vHJQJFFosItRBuGebqAt4dpZuWAr/kksQRVEcZ2dgDtfNn+2nJLtoK9+f2JTSEagL8
 Cg4d1QID27pq6WpV0QPJyDLOr+64WNsCiiYWQNjn8wvsWLg1h8L0S35gUe83H+DRw1Ji
 PYq4LpTCQmDTBTw4oa4UhzWVIOK0+pjf1Ld/M7NTjJqpCoMk5qm/pTQukl8L2lday6nQ
 WrOWZdGjM4x8NsBiXlL9eEt/22K05lWNFZWe5eCDaHftVhy8VSz1q8yPhF+EmrRll/7P
 dJ5XLv4JGGMjKeQZtrkbUXFoomJd6jspi90stYEwVkXVWcXdB5Fbf0PKERu6+zjcFrv+
 MvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LOCSnm/N1pBHltn95vUZhkchMq85yLIfAmB1PF+x18Q=;
 b=AryhTvj7RlN02L2rtPVUST+W+hyNJqQKhV3DD7JZWcNXvaAp0mhupSu1RU7p4gkwe3
 GuFKpR2eEGtEWYn+4MdM/HUOoYdpEdnkbJ/dS1EF7e7RlATR3Ao/aKUY4n+zD4JFaheq
 taz/ZZEfc+CljrQq4cpiLfPrfBOne/LDSmfI6A4fYZjkfMsWgv2jak/Zz/5bGDOixqfx
 62WWHF+MIBZr5qf0iOlpCa4eR9Wc9t/lwbECB0bc4Eq42/l4W6SYnPsSRBJbnI+EKi2n
 vCdf5H5kTqup14uYRFxv79Vf2+oecv6w6qbb3ArzVm7+4vAp8tZ9K5QU3Fv+yzm7mwDO
 ujBw==
X-Gm-Message-State: AOAM531gulVdAkN0PyNYA/HbK62Z/hl+pOAw/Mor2uIfJ3hZFzuYwLxh
 C7tzeeAFMC/lFqTNN5w+lrq829cjqiU=
X-Google-Smtp-Source: ABdhPJyenvUxqy264W7BiaKIJZQl8UKV6nqPJ/WfPqvKTLZW8GJpOFS9FNmOoshAZAxHVR7HpaBv7A==
X-Received: by 2002:a50:9345:: with SMTP id n5mr3659396eda.289.1624354346093; 
 Tue, 22 Jun 2021 02:32:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id r6sm1955880eds.47.2021.06.22.02.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:32:25 -0700 (PDT)
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: linux@zary.sk, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20210614110517.1624-1-christian.koenig@amd.com>
Message-ID: <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
Date: Tue, 22 Jun 2021 11:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614110517.1624-1-christian.koenig@amd.com>
Content-Language: en-US
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix dma_address check for
 CPU/GPU sync
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UGluZz8gRG9lcyBhbnlib2R5IHdhbnRzIHRvIGdpdmUgbWUgYW4gcmIgb3IgYWNrZWQtYnk/CgpB
R1AgaXMgYmFzaWNhbGx5IGJyb2tlbiBvbiBub3V2ZXUgd2l0aG91dCB0aGlzLgoKQ2hyaXN0aWFu
LgoKQW0gMTQuMDYuMjEgdW0gMTM6MDUgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFHUCBm
b3IgZXhhbXBsZSBkb2Vzbid0IGhhdmUgYSBkbWFfYWRkcmVzcyBhcnJheS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDQgKystLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAzZTA5ZGYwNDcyY2UuLjE3MGFiYTk5YTEx
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtNTQ2LDcgKzU0
Niw3IEBAIG5vdXZlYXVfYm9fc3luY19mb3JfZGV2aWNlKHN0cnVjdCBub3V2ZWF1X2JvICpudmJv
KQo+ICAgCXN0cnVjdCB0dG1fdHQgKnR0bV9kbWEgPSAoc3RydWN0IHR0bV90dCAqKW52Ym8tPmJv
LnR0bTsKPiAgIAlpbnQgaSwgajsKPiAgIAo+IC0JaWYgKCF0dG1fZG1hKQo+ICsJaWYgKCF0dG1f
ZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVzcykKPiAgIAkJcmV0dXJuOwo+ICAgCWlmICghdHRt
X2RtYS0+cGFnZXMpIHsKPiAgIAkJTlZfREVCVUcoZHJtLCAidHRtX2RtYSAweCVwOiBwYWdlcyBO
VUxMXG4iLCB0dG1fZG1hKTsKPiBAQCAtNTgyLDcgKzU4Miw3IEBAIG5vdXZlYXVfYm9fc3luY19m
b3JfY3B1KHN0cnVjdCBub3V2ZWF1X2JvICpudmJvKQo+ICAgCXN0cnVjdCB0dG1fdHQgKnR0bV9k
bWEgPSAoc3RydWN0IHR0bV90dCAqKW52Ym8tPmJvLnR0bTsKPiAgIAlpbnQgaSwgajsKPiAgIAo+
IC0JaWYgKCF0dG1fZG1hKQo+ICsJaWYgKCF0dG1fZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVz
cykKPiAgIAkJcmV0dXJuOwo+ICAgCWlmICghdHRtX2RtYS0+cGFnZXMpIHsKPiAgIAkJTlZfREVC
VUcoZHJtLCAidHRtX2RtYSAweCVwOiBwYWdlcyBOVUxMXG4iLCB0dG1fZG1hKTsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
