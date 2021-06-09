Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD73A18D9
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0D66E420;
	Wed,  9 Jun 2021 15:13:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB16E420;
 Wed,  9 Jun 2021 15:13:16 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id i17so26732601ilj.11;
 Wed, 09 Jun 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6tH9AOagkax/O9BjJ9j1G1+5RQygul9R1dISwXADcHw=;
 b=a/5jHUeAhMVhK8wrcVbUr5KRMACc+WsTq7/EZ6Y3Or8PAmHSBXPJ77ObGTLyY+f3d3
 i9IZ7Bwtpa/3KMnKNBHvXtpbwR5GI83hkuhswDa5PMal0iGefqc0BQ+D/7L13aEa9yEA
 C1zlQeLdqCfYomPNXJckEQCMsEUZpcIUXN5y40WDq9w/+X8QvM9SR9OpFgs5ytCV+n+X
 T1v32i61zeUiJ7/Eg1Pg84rLCIT7BxdJHVuTuIy96P4rJnPxFgf54avx1sh+Fw3MSTKZ
 PAEe5Rl5FvYkW5VT2/Gi64q2L8FEQj9aCjy9MEP9/3sTpYZKmWEWv6gYngIGYWKh4hWg
 ADig==
X-Gm-Message-State: AOAM5335o+B1Hq+QMZlhz4eUWzXtNN2rnx+W56brVB66sUjM+h9fUKZv
 RIgZJBe/sRsh3agUT+64rKXeXauYc2Isf1/FlVwCDE1qvsM=
X-Google-Smtp-Source: ABdhPJxbB4VcVleBOfm2GHknEWMtgPQER9zM3CwQk5d08EKzfS/w15P5/P4q3Dny0FXMg4bRGYQPTSzMEDLCzeO+G6U=
X-Received: by 2002:a6b:c386:: with SMTP id t128mr23322633iof.65.1623251595657; 
 Wed, 09 Jun 2021 08:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
 <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
 <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
In-Reply-To: <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 9 Jun 2021 11:13:04 -0400
Message-ID: <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

R0VNIGluaXQgaGFwcGVucyBoZXJlOgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtL3RyZWUvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYyNuMjIxCgpOb3Rl
IHRoZSBibyBhbGxvYyAvIGdlbSBpbml0IC8gYm8gaW5pdCBkYW5jZS4KCkkgZG9uJ3QgdGhpbmsg
dGhlcmUgaXMgYSBHRU0gb2JqZWN0IGZvciBpbnRlcm5hbCBhbGxvY2F0aW9ucyBhdCBhbGwgLS0K
d2UganVzdCBhbGxvY2F0ZSBibydzIGRpcmVjdGx5IGFuZCB0aGF0J3MgaXQuIFBlcmhhcHMgeW91
IG1lYW50CnNvbWV0aGluZyBlbHNlPyBJIHRob3VnaHQgR0VNIHdhcyBtZWFudCBmb3IgZXh0ZXJu
YWxseS1hdmFpbGFibGUKb2JqZWN0cy4KCkNoZWVycywKCiAgLWlsaWEKCk9uIFdlZCwgSnVuIDks
IDIwMjEgYXQgMTA6NTggQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPgo+IEdvb2QgcG9pbnQsIGJ1dCBJIHRoaW5rIHRoYXQgaXMgdW5yZWxhdGVk
Lgo+Cj4gTXkgc3VzcGljaW9uIGlzIHJhdGhlciB0aGF0IG5vdXZlYXUgaXMgbm90IGluaXRpYWxp
emluZyB0aGUgdW5kZXJseWluZwo+IEdFTSBvYmplY3QgZm9yIGludGVybmFsIGFsbG9jYXRpb25z
Lgo+Cj4gU28gd2hhdCBoYXBwZW5zIGlzIHRoZSBzYW1lIGFzIG9uIFZNV0dGWCB0aGF0IFRUTSBk
b2Vzbid0IGtub3cgYW55dGhpbmcKPiBhYm91dCB0aGUgc2l6ZSB0byBvZiB0aGUgQk8gcmVzdWx0
aW5nIGluIGEga21hbGxvYygpIHdpdGggYSByYW5kb20gdmFsdWUKPiBhbmQgZXZlbnR1YWxseSAt
RU5PTUVNLgo+Cj4gR29vZCBuZXdzIGlzIHRoYXQgSSBjYW4gcmVwcm9kdWNlIGl0LCBzbyBnb2lu
ZyB0byBsb29rIGludG8gdGhhdCBsYXRlcgo+IHRvZGF5Lgo+Cj4gUmVnYXJkcywKPiBDaHJpc3Rp
YW4uCj4KPiBBbSAwOS4wNi4yMSB1bSAxNjo1MiBzY2hyaWViIElsaWEgTWlya2luOgo+ID4gQ2hy
aXN0aWFuIC0gcG90ZW50aWFsbHkgcmVsZXZhbnQgaXMgdGhhdCBUZWdyYSBkb2Vzbid0IGhhdmUg
VlJBTSBhdAo+ID4gYWxsIC0tIGFsbCBHVFQgKG9yIEdBUlQgb3Igd2hhdGV2ZXIgaXQncyBjYWxs
ZWQgbm93YWRheXMpLiBObwo+ID4gZmFrZS9zdG9sZW4gVlJBTS4KPiA+Cj4gPiBDaGVlcnMsCj4g
Pgo+ID4gICAgLWlsaWEKPiA+Cj4gPiBPbiBXZWQsIEp1biA5LCAyMDIxIGF0IDEwOjE4IEFNIENo
cmlzdGlhbiBLw7ZuaWcKPiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4+
IEhpIE1pa2tvLAo+ID4+Cj4gPj4gc3RyYW5nZSBzb3VuZHMgbGlrZSBOb3V2ZWF1IHdhcyBzb21l
aG93IGFsc28gdXNpbmcgdGhlIEdFTSB3b3JrYXJvdW5kCj4gPj4gZm9yIFZNV0dGWCBhcyB3ZWxs
Lgo+ID4+Cj4gPj4gQnV0IC0xMiBtZWFucyAtRU5PTUVNIHdoaWNoIGRvZXNuJ3QgZml0cyBpbnRv
IHRoZSBwaWN0dXJlLgo+ID4+Cj4gPj4gSSB3aWxsIHRyeSB3aXRoIGEgRzcxMCwgYnV0IGlmIHRo
YXQgZG9lc24ndCB5aWVsZHMgYW55dGhpbmcgSSBuZWVkIHNvbWUKPiA+PiBtb3JlIGlucHV0IGZy
b20geW91Lgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0LAo+ID4+IENocmlzdGlhbi4K
PiA+Pgo+ID4+Cj4gPj4gQW0gMDkuMDYuMjEgdW0gMTU6NDcgc2NocmllYiBNaWtrbyBQZXJ0dHVu
ZW46Cj4gPj4+IEhpLAo+ID4+Pgo+ID4+PiBJJ20gb2JzZXJ2aW5nIG5vdXZlYXUgbm90IGluaXRp
YWxpemluZyByZWNlbnRseSBvbiBsaW51eC1uZXh0IG9uIG15Cj4gPj4+IFRlZ3JhMTg2IEpldHNv
biBUWDIgYm9hcmQuIFNwZWNpZmljYWxseSBpdCBsb29rcyBsaWtlIEJPIGFsbG9jYXRpb24gaXMK
PiA+Pj4gZmFpbGluZyB3aGVuIGluaXRpYWxpemluZyB0aGUgc3luYyBzdWJzeXN0ZW06Cj4gPj4+
Cj4gPj4+IFsgICAyMS44NTgxNDldIG5vdXZlYXUgMTcwMDAwMDAuZ3B1OiBEUk06IGZhaWxlZCB0
byBpbml0aWFsaXNlIHN5bmMKPiA+Pj4gc3Vic3lzdGVtLCAtMjgKPiA+Pj4KPiA+Pj4gSSBoYXZl
IGJlZW4gYmlzZWN0aW5nIGFuZCBJIGhhdmUgZm91bmQgdHdvIHBhdGNoZXMgdGhhdCBhZmZlY3Qg
dGhpcy4KPiA+Pj4gRmlyc3RseSwgdGhpbmdzIGZpcnN0IGJyZWFrIG9uCj4gPj4+Cj4gPj4+IGQw
MjExN2Y4ZWZhYSBkcm0vdHRtOiByZW1vdmUgc3BlY2lhbCBoYW5kbGluZyBmb3Igbm9uIEdFTSBk
cml2ZXJzCj4gPj4+Cj4gPj4+IHN0YXJ0aW5nIHRvIHJldHVybiBlcnJvciBjb2RlIC0xMi4gVGhl
biwgYXQKPiA+Pj4KPiA+Pj4gZDc5MDI1YzdmNWUzIGRybS90dG06IGFsd2F5cyBpbml0aWFsaXpl
IHRoZSBmdWxsIHR0bV9yZXNvdXJjZSB2Mgo+ID4+Pgo+ID4+PiB0aGUgZXJyb3IgY29kZSBjaGFu
Z2VzIHRvIHRoZSBhYm92ZSAtMjguCj4gPj4+Cj4gPj4+IElmIEkgY2hlY2tvdXQgb25lIGNvbW1p
dCBwcmlvciB0byBkNzkwMjVjN2Y1ZTMgYW5kIHJldmVydAo+ID4+PiBkMDIxMTdmOGVmYWEsIHRo
aW5ncyB3b3JrIGFnYWluLiBUaGVyZSBhcmUgYSBidW5jaCBvZiBvdGhlciBUVE0KPiA+Pj4gY29t
bWl0cyBiZXR3ZWVuIHRoaXMgYW5kIEhFQUQsIHNvIHJldmVydGluZyB0aGVzZSBvbiB0b3Agb2Yg
SEVBRAo+ID4+PiBkb2Vzbid0IHdvcmsuIEhvd2V2ZXIsIEkgY2hlY2tlZCB0aGF0IGJvdGggeWVz
dGVyZGF5J3MgYW5kIHRvZGF5J3MKPiA+Pj4gbmV4dHMgYXJlIGFsc28gYnJva2VuLgo+ID4+Pgo+
ID4+PiBUaGFuayB5b3UsCj4gPj4+IE1pa2tvCj4gPj4+Cj4gPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+
ID4+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGbm91dmVhdSZhbXA7ZGF0YT0wNCU3
QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NhYWYwOWNiZWEwYjA0ZDhkYzAxMjA4
ZDkyYjU2MzdiYSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2
Mzc1ODg0NzI0NDUzMDgyOTAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAw
MCZhbXA7c2RhdGE9ZVBvV1Z0SFBYZUs1UlRoa1J1UVN5a0tyZldDZ1BPekc1Q0xUemZ3OSUyRnV3
JTNEJmFtcDtyZXNlcnZlZD0wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
