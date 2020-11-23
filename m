Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678552C1B46
	for <lists+nouveau@lfdr.de>; Tue, 24 Nov 2020 03:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746E86E1A4;
	Tue, 24 Nov 2020 02:08:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2789D63
 for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2020 12:30:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p19so13053864wmg.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2020 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
 b=loC7jwFZZxCVRUrWK3gkEV+nGPQO8gNgJHe9CO8Ho/sjQ+3TR3d9I8PAGUmT32DpLd
 XF45t36teSRWCy5rRGkpKWWKho4bfob6jVR4z87QtSvdZY+PWwuEG6552uCFfZYGYwWM
 TeYvw5BHHdArvuLvMR6+jWWE7Gf3wl5/CHG1ip4kmRu8V0NI08HHBZtzJx2Nzs78Lifm
 ofQpQZSHatSAZOcoxUFcKOu45nQW820RNRa6+iq0oOol4VBdbXPNzbW6QVWqZLRfRJMu
 8X1JkcflXcrN8J8rJ2VsTx30DouJ3eTevyQcQc/epohTycYBeGuQ+QjUC2P7tdgAjjFH
 IThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
 b=THalb/YRMJc9ssXeJQsp0lw8QPJwaKcQd6AVM4+LI5m/IUsrqIYG9j2rAAmHq2DQJl
 Yx8xcb/HAJwXoZ+WOggKoKp8urjyGZeOv0VMIIbpslSYXYVNM9rKoTvRyyqNXqL5+bi9
 oO0iOMOl1fiu33wrRi+bl3T2ay1rWgDodwjGAxW75aZSrVgKmIqFrk8iZK0nGeGUEspt
 A3DX/grCIUBAPWo1OXoIFW3/o3ZoNWP6KllPmLvDfEOxjhxQQOs+ar4cK9JFlLc5N9k1
 JraPuauFn28lrb9RaR4my8SASRTEtGX351vtKw0rhfOhadSmhdKA5iRjyff7JbaS8gsc
 9mmA==
X-Gm-Message-State: AOAM5336u5mVwhZavcAKqpXH5PNqL+yKOIK4MRVx9pgbs/oArgFA63ZJ
 yOjacTBG/+pqPkcMVwszaBhbGw==
X-Google-Smtp-Source: ABdhPJyDOBP0tlstfPSopOHwDgmQuvftD21pkr092ilv2i4DAaBWKV4gEPJF2xEJaLrKvkQTiu1XiQ==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr23315406wme.158.1606134619163; 
 Mon, 23 Nov 2020 04:30:19 -0800 (PST)
Received: from dell ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id q16sm19309395wrn.13.2020.11.23.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 04:30:18 -0800 (PST)
Date: Mon, 23 Nov 2020 12:30:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <20201123123016.GA4716@dell>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 02:07:49 +0000
Subject: Re: [Nouveau] [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
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
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 Sonny Jiang <sonny.jiang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Likun Gao <Likun.Gao@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jiansong Chen <Jiansong.Chen@amd.com>,
 linux-media@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBOb3YgMjAyMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKCj4gT25seSBza2lt
bWVkIG92ZXIgdGhlbSwgYnV0IG92ZXIgYWxsIGxvb2tzIHNhbmUgdG8gbWUuCj4gCj4gU2VyaWVz
IGlzIEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CgpUaGFua3MgQ2hyaXN0aWFuLCBtdWNoIGFwcHJlY2lhdGVkLgoKPiBBbSAyMy4xMS4yMCB1bSAx
MjoxOCBzY2hyaWViIExlZSBKb25lczoKPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIg
ZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiBrZXJuZWwgYnVpbGRzLCB3aGlj
aCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+ID4gbmlnZ2x5IGxp
dHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gT25seSA5MDAgKGZyb20gNTAwMCkgdG8gZ28hCj4gPiAK
PiA+IExlZSBKb25lcyAoNDApOgo+ID4gICAgZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlOiBDb25z
dW1lIG91ciBvd24gaGVhZGVyIHdoZXJlIHRoZSBwcm90b3R5cGVzCj4gPiAgICAgIGFyZSBsb2Nh
dGVkCj4gPiAgICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtOiBBZGQgZGVzY3JpcHRpb24gZm9y
ICdwYWdlX2ZsYWdzJwo+ID4gICAgZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liOiBQcm92aWRlIGRv
Y3MgZm9yICdhbWRncHVfaWJfc2NoZWR1bGUoKSdzCj4gPiAgICAgICdqb2InIHBhcmFtCj4gPiAg
ICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydDogQ29ycmVjdCBwb3NzaWJsZSBjb3B5L3Bhc3Rl
IG9yIGRvYy1yb3QKPiA+ICAgICAgbWlzbmFtaW5nIGlzc3VlCj4gPiAgICBkcm0vYW1kL2FtZGdw
dS9jaWtfaWg6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IgJ2loJyBpbgoKWy4uLl0KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
