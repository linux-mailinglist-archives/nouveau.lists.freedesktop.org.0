Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8C3488B0
	for <lists+nouveau@lfdr.de>; Thu, 25 Mar 2021 07:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D05B6EB1C;
	Thu, 25 Mar 2021 06:00:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B971B6E9B5
 for <nouveau@lists.freedesktop.org>; Wed, 24 Mar 2021 10:36:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x16so23886094wrn.4
 for <nouveau@lists.freedesktop.org>; Wed, 24 Mar 2021 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dEFFBRSXu0odutvmmG/Rwg2Sz2HimxEx+pN3ka/bnVc=;
 b=DOZKukNzPwBLODbuM7S0fhx3nEbU8wUrLkI+akr9xvK/Gn2cEkrVU5mSaLlohKzWUM
 IQkfJ4YQkOKMBazPQvbAWzdDFP3Pw6sQVJz5npSdYbHyY5D+97tiYkJ7sHJNebnH5qsm
 0tl9dSCS/MCcNsWpo95djxWqsO64QF8ensbtsRQ+wiq5hwJ8ZBDySd8GUAFJFBxdGmvR
 jEKykXmw1j4WN055zMGSRxaoUH0Mk1lSbDSTB67aaiipXHd9Df435ucMGT4YF0wFargI
 i/kPWeaegH1BvjP03zxQGdMBRdPYrgta44l0928G9W3U65Nais46ChTzh4NwrxzMpihp
 EVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dEFFBRSXu0odutvmmG/Rwg2Sz2HimxEx+pN3ka/bnVc=;
 b=T5TOa4GHiT8d4pP0CkfjYLw5KxJbD9z58hxlGNxLh35BMJj3lG6b5labctyXy+JO3W
 02dFI5AZBiiLTkPc7qPWBxFQcaRIstrvKr9q7LPy4eNUvmtsMNE7Rx51OyuWohbZ1tyB
 WXUxvrxgDPABGZpDFHjPT8Btj6e7enduhIuqfVqYLO6oAAeLiy2HMPweDQ312IDy12il
 WRaOuHRYS6Bq4NiFIjrSsEqQN5Ld2sfU2Mkd55arxJBsYbsfJ7DGMWkPVjaM4UxNLzok
 TbBw8w9JfhdaS+iZIpYImf9LKMZeqgmMUs2GXDa5DadU2gwws6L9E7pQpTm0lE45s8EX
 wnCg==
X-Gm-Message-State: AOAM533rSyeY1kkDHqbQyBnWqu4Gfjj7osoyp8hZyi3D7YcWvylfCrSD
 t2oI7ycE+FcLsqp6GbDZwwYKOA==
X-Google-Smtp-Source: ABdhPJxI3r3iiWfvHOD+ErGz9Iu/oghrzTasZEnAeZqBD2lmagfmv90aTaU0jHjCwgR5t2MyzwXykw==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr2725687wru.401.1616582174392; 
 Wed, 24 Mar 2021 03:36:14 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id l6sm2070476wrn.3.2021.03.24.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 03:36:14 -0700 (PDT)
Date: Wed, 24 Mar 2021 10:36:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210324103611.GJ2916463@dell>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
X-Mailman-Approved-At: Thu, 25 Mar 2021 06:00:15 +0000
Subject: Re: [Nouveau] [RESEND 00/19] Rid GPU from W=1 warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RGFuaWVsLAoKPiBNSU1FLVZlcnNpb246IDEuMAo+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOAo+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiAKPiBUaGlz
IGlzIGEgcmVzZW5kIG9mIHRoZSByZW1haW5pbmcgcGF0Y2hlcy4KPiAKPiBBbGwgb2YgdGhlc2Ug
cGF0Y2hlcyBoYXZlIGJlZW4gc2VudCBiZWZvcmUuCgpBcmUgeW91IHN0aWxsIGtlZW4gdG8gJ2hv
b3ZlciB0aGVzZSB1cCc/CgpKdXN0IGxlYXZlIHRoZSBvbmUgdGhhdCByZXF1aXJlcyB3b3JrIGFu
ZCB0YWtlIHRoZSByZXN0IHBlcmhhcHM/Cgo+IExlZSBKb25lcyAoMTkpOgo+ICAgZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0OiBEZW1vdGUgb2J2aW91cyBhYnVzZSBvZiBrZXJuZWwt
ZG9jCj4gICBkcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxl
ICdyZXQnCj4gICBkcm0vbXNtL2RwL2RwX2Rpc3BsYXk6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUg
J2hwZCcKPiAgIGluY2x1ZGU6IGRybTogZHJtX2F0b21pYzogTWFrZSB1c2Ugb2YgJ25ld19wbGFu
ZV9zdGF0ZScKPiAgIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3ZvbHQvZ2syMGE6IERlbW90ZSBu
b24tY29uZm9ybWFudCBrZXJuZWwtZG9jCj4gICAgIGhlYWRlcnMKPiAgIGRybS9hbWQvZGlzcGxh
eS9kYy9jYWxjcy9kY2VfY2FsY3M6IE1vdmUgc29tZSBsYXJnZSB2YXJpYWJsZXMgZnJvbSB0aGUK
PiAgICAgc3RhY2sgdG8gdGhlIGhlYXAKPiAgIGRybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2Vf
Y2FsY3M6IFJlbW92ZSBzb21lIGxhcmdlIHZhcmlhYmxlcyBmcm9tCj4gICAgIHRoZSBzdGFjawo+
ICAgZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlOiBNYWtlIGxvY2FsIGZ1
bmN0aW9ucyBzdGF0aWMKPiAgIGRybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwOiBEZW1v
dGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwo+ICAgICBoZWFkZXIKPiAgIGRybS9ub3V2ZWF1
L25vdXZlYXVfYm86IFJlbW92ZSB1bnVzZWQgdmFyaWFibGVzICdkZXYnCj4gICBkcm0vbm91dmVh
dS9ub3V2ZWF1X2Rpc3BsYXk6IFJlbW92ZSBzZXQgYnV0IHVudXNlZCB2YXJpYWJsZSAnd2lkdGgn
Cj4gICBkcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjOiBEZW1vdGUgbm9uLWNvbmZvcm1pbmcga2Vy
bmVsLWRvYyBoZWFkZXJzCj4gICBkcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwOiBSZW1vdmUgdW51
c2VkIHZhcmlhYmxlICdyZXQnIGZyb20gZnVuY3Rpb24KPiAgICAgcmV0dXJuaW5nIHZvaWQKPiAg
IGRybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkOiBNYWtlIGxvY2FsIGZ1bmN0aW9uICdoZWFk
YzU3ZF9vbHV0Jwo+ICAgICBzdGF0aWMKPiAgIGRybS9ub3V2ZWF1L252NTBfZGlzcGxheTogUmVt
b3ZlIHN1cGVyZmx1b3VzIHByb3RvdHlwZSBmb3IgbG9jYWwKPiAgICAgc3RhdGljIGZ1bmN0aW9u
cwo+ICAgZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcDogSW5jbHVkZSBoZWFkZXIgY29udGFpbmlu
ZyBvdXIgcHJvdG90eXBlcwo+ICAgZHJtL25vdXZlYXUvbm91dmVhdV9pb2MzMjogRmlsZSBoZWFk
ZXJzIGFyZSBub3QgZ29vZCBjYW5kaWRhdGVzIGZvcgo+ICAgICBrZXJuZWwtZG9jCj4gICBkcm0v
bm91dmVhdS9ub3V2ZWF1X3N2bTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0JyBmcm9tIHZv
aWQKPiAgICAgZnVuY3Rpb24KPiAgIGRybS9ub3V2ZWF1L25vdXZlYXVfaW9jMzI6IERlbW90ZSBr
ZXJuZWwtZG9jIGFidXNlIHRvIHN0YW5kYXJkIGNvbW1lbnQKPiAgICAgYmxvY2sKPiAKPiAgLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgIHwgMTE1NCArKysrKysr
KystLS0tLS0tLQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNl
LmMgfCAgIDE2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jICAgICAg
ICAgICB8ICAgIDMgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMg
ICAgICAgfCAgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YyAgICAgICB8ICAgMTAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVh
ZGM1N2QuYyAgIHwgICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmMgICAgICAgICAgfCAgICA0IC0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmMgICAgIHwgICAgOCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2lvYzMyLmMgICAgICAgfCAgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc3ZtLmMgICAgICAgICB8ICAgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnY1
MF9kaXNwbGF5LmggICAgICAgIHwgICAgMyAtCj4gIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9l
bmdpbmUvZ3IvZ2YxMDAuYyAgICB8ICAgIDIgKy0KPiAgLi4uL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9iaW9zL2luaXQuYyAgIHwgIDIwNCArLS0KPiAgLi4uL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi92b2x0L2drMjBhLmMgIHwgICAgNCArLQo+ICBpbmNsdWRlL2RybS9kcm1fYXRv
bWljLmggICAgICAgICAgICAgICAgICAgICAgfCAgICAzICstCj4gIDE1IGZpbGVzIGNoYW5nZWQs
IDY5MiBpbnNlcnRpb25zKCspLCA3MzQgZGVsZXRpb25zKC0pCj4gCj4gQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+Cj4gQ2M6IEJl
biBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IEplcmVteSBL
b2xiIDxqa29sYkBicmFuZGVpcy5lZHU+Cj4gQ2M6IEt1b2dlZSBIc2llaCA8a2hzaWVoQGNvZGVh
dXJvcmEub3JnPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogbGluYXJv
LW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+Cj4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4g
Q2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
