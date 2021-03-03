Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7932B95D
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 18:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D832789B12;
	Wed,  3 Mar 2021 17:02:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A8189B12
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 17:02:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u16so6475588wrt.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lzsTsdCAx8D4Ik6W9PcyIqkrBE4DuoszcXsItGihau8=;
 b=M7VnXGBrGKhzkXpHqUnCC7QEYODfWHbyb+AioZAuJepz+xagsA6G9WtnCTP6GPbW5b
 lUyuYBZUGFasFF5QMniczZoG2eEwpwYUQKn+7bF4FTvqlhSgdrts+AcaRaAMyrRvwkgS
 6PQ1n2LY++Hj6B3ic9KWQzNciA9wVd2sD+hLe5iwLcpY1KaNrtLLEci7ruQpLdfQJUIB
 86Z54vgme7Fp4Q34a+ok4HPTwcQjxaQD+rYaUIjInQM20niuIKAcro8ShEeXkg0a039T
 MozLCoavJwq2sgxTZvdq8JgnYXcwerfbmOI/hM9r/oTywCbVTU4BD+xPtmV5iulZzdTX
 2C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lzsTsdCAx8D4Ik6W9PcyIqkrBE4DuoszcXsItGihau8=;
 b=iGM+yxRozOw6KkdCyGaBcaNHFdZAyVZGq3H3rvSK0yvzV+lfKs+VVQI9IkfXIhdBEG
 Iap2Ck9B0rp67AQRDUIp33tbNfOadw5NoiaSr3cVDaoKhKsbNM+WQU1JZwp/msOwV1Ky
 T09TONnccoV7KuHQ0J9grd20xR95i+Cmr6yLjrquYhvjZKr2eveAKTs9WFYztqTOFhmU
 2P36NUs/O3Vlfuj3r2dKAFXbzlRt2IQ7++KTCMgaSLmCE5nzb1rhyC+qKLQBkR3fLipb
 Mha/wPcSGe/f5ZxJqqL3YRjeKB/6bPhDorUKpMFOqe718nHDJFcYkcmSnqPSt5QacwwZ
 RCjw==
X-Gm-Message-State: AOAM5319RQSKPZlzy+iCSUvW/cFB3hwhDqDVfzgr7Nx3UV/3V6Afc4BB
 JO3ThLYecQ1mu0PHNcq1Qr4=
X-Google-Smtp-Source: ABdhPJw5qbcZttAUay/au8fTeyUJuCj0y/g+IOS5dgMyWegNLFauz/d2Jeg5+ONxZ6Q6xpDSA8nPsw==
X-Received: by 2002:adf:a219:: with SMTP id p25mr28307657wra.400.1614790958729; 
 Wed, 03 Mar 2021 09:02:38 -0800 (PST)
Received: from ?IPv6:2001:7c0:2049:1d4:1129:608a:9c75:e241?
 ([2001:7c0:2049:1d4:1129:608a:9c75:e241])
 by smtp.googlemail.com with ESMTPSA id l2sm3628548wml.38.2021.03.03.09.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 09:02:38 -0800 (PST)
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
 <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
 <4cfd5800-1f3a-4740-244c-599601517cda@gmail.com>
 <CAKb7UviXJp30K5VBdNS_THru8Er-p4OHKad4Oxuxm8Pdck_yRQ@mail.gmail.com>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
Message-ID: <c0cb8898-e395-99a4-c93a-a3e2f1442305@gmail.com>
Date: Wed, 3 Mar 2021 18:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UviXJp30K5VBdNS_THru8Er-p4OHKad4Oxuxm8Pdck_yRQ@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Reply-To: uwe.sauter.de@gmail.com
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMDMuMDMuMjEgdW0gMTQ6MzMgc2NocmllYiBJbGlhIE1pcmtpbjoKPiBPbiBXZWQsIE1hciAz
LCAyMDIxIGF0IDg6MjUgQU0gVXdlIFNhdXRlciA8dXdlLnNhdXRlci5kZUBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiBBbSAwMy4wMy4yMSB1bSAxNDoxMiBzY2hyaWViIElsaWEgTWlya2luOgo+Pj4g
T24gV2VkLCBNYXIgMywgMjAyMSBhdCA3OjQxIEFNIEFsZXggUmllc2VuIDxhbGV4YW5kZXIucmll
c2VuQGNldGl0ZWMuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IElsaWEgTWlya2luLCBTYXQsIEZlYiAy
NywgMjAyMSAyMjoyNjo1NyArMDEwMDoKPj4+Pj4gQ2FuIHlvdSB0cnkgQWxleCdzIHBhdGNoIHRv
IG1vZGV0ZXN0IGFuZCBjb25maXJtIHRoYXQgeW91IHNlZSBpc3N1ZXMKPj4+Pj4gd2l0aCBtb2Rl
dGVzdD8gSWYgc28sIGNhbiB5b3UgKGFuZCBtYXliZSBBbGV4IGFzIHdlbGwpIHRyeSBhbiBvbGRl
cgo+Pj4+PiBrZXJuZWwgKEknbSBvbiA1LjYpIGFuZCBzZWUgaWYgbW9kZXRlc3QgYmVoYXZlcyB3
ZWxsIHRoZXJlLiBbVGhlIHBhdGNoCj4+Pj4+IGluIHF1ZXN0aW9uIHdhcyB0byBleHBvc2UgMjU2
eDI1NiBhcyB0aGUgJ3ByZWZlcnJlZCcgc2l6ZSwgYnV0IHN1cHBvcnQKPj4+Pj4gZm9yIHRoZSBs
YXJnZXIgY3Vyc29ycyBoYXMgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUuXSBBbGV4IC0gaWYgeW91
Cj4+Pj4+IGhhdmUgdGltZSwgc2FtZSBxdWVzdGlvbiB0byB5b3UuCj4+Pj4KPj4+PiBTb3JyeSB0
aGF0IGl0IHRvb2sgc28gbG9uZy4gSSByZXRlc3RldCB3aXRoIHRoZSBzYW1lIGtlcm5lbCBhcyBV
d2UgZGlkCj4+Pj4gKDUuNC4xMDEpIGFuZCBteSByZXN1bHRzIGFyZSB0aGUgc2FtZTogbW9kZXRl
c3Qgd2l0aCA2NCBhbmQgMTI4IGN1cnNvcnMgbG9va3MKPj4+PiBnb29kLCAyNTYgYnJva2VuLiBE
aWRuJ3QgdGVzdCB3aXRoIFggdGhpcyB0aW1lICh0aGlzIGJlaW5nIG15IG1haW4gb2ZmaWNlCj4+
Pj4gbWFjaGluZSksIGJ1dCBjYW4gZG8gbGF0ZXIgaWYgcmVxdWlyZWQuCj4+Pgo+Pj4gVGhhbmtz
IGZvciBjb25maXJtaW5nISBObyBuZWVkIHRvIHRlc3QgWCAtIHRoYXQgd2lsbCB3b3JrIGZpbmUs
IHNpbmNlCj4+PiB3ZSB3ZXJlIHJlcG9ydGluZyB0aGUgc21hbGxlciBjdXJzb3JzIG9uIHRoYXQg
a2VybmVsLgo+Pj4KPj4+IFNvIEkgdGhpbmsgd2UgaGF2ZSBkZWZpbml0aXZlIGV2aWRlbmNlIHRo
YXQgYXQgbGVhc3QgYWxsIEtlcGxlcgo+Pj4gZG9lc24ndCBkbyAyNTZ4MjU2IChhbmQgaXQncyBu
b3QganVzdCBzb21lIGJ1ZyBpbiB0aGUgZGlzcGxheSBtYWNybwo+Pj4gcmV3b3JrIHRoYXQgZ290
IGludHJvZHVjZWQpLiBBbmQgdW5sZXNzIEknbSBibGluZCBhbmQgZG9uJ3Qgc2VlIHRoZQo+Pj4g
Y29ycnVwdGlvbiwgUGFzY2FsIHNlZW1zIGZpbmUuIFF1ZXN0aW9uIHJlbWFpbnMgZm9yIE1heHdl
bGwxLzIgR1BVcy4KPj4+IFVubGVzcyBzb21lb25lIGhhcyBpbW1lZGlhdGUgcGxhbnMgdG8gdGVz
dCBvbiB0aG9zZSwgSSdkIHJlY29tbWVuZAo+Pj4gYnVtcGluZyB0aGUgbWluaW11bSBmb3IgMjU2
eDI1NiBiZWluZyByZXBvcnRlZCB0byBQYXNjYWwsIGFuZCBkb2luZwo+Pj4gMTI4eDEyOCBmb3Ig
S2VwbGVyIC8gTWF4d2VsbC4KPj4KPj4gVGhlIG9ubHkgb2xkZXIgbW9kZWwgSSBoYXZlIGFjY2Vz
cyB0byB3b3VsZCBiZSBhIDY2MDBHVCAoTlY0MykuIERvbid0IGtub3cgaWYgdGhpcyB3b3VsZCBo
YXZlIGFueQo+PiBzaWduaWZpY2FuY2XigKYKPiAKPiBOb3BlLCB3ZSB3YW50IG5ld2VyIDopIE1h
eHdlbGwgY2FtZSBhZnRlciBLZXBsZXIuIEdUWCA3NTAgZm9yIE1heHdlbGwKPiAxLCBhbmQgR1RY
IDl4eCBmb3IgTWF4d2VsbCAyLiAoR00xMHggYW5kIEdNMjB4KS4KCkkgbWFuYWdlZCB0byBnZXQg
YWNjZXNzIHRvIHR3byBtdWNoIG5ld2VyIGNhcmRzLCBSVEsgMTA3MCBhbmQgdGhlIGxpa2UuCgpT
aG91bGQgSSB0ZXN0IHRoZXNlIG9yIGlzIGl0IG5vdCBuZWNlc3Nhcnk/CgpSZWdhcmRzLAoKCVV3
ZQoKCj4gQ2hlZXJzLAo+IAo+ICAgLWlsaWEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQo=
