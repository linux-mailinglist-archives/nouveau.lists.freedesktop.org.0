Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF292327472
	for <lists+nouveau@lfdr.de>; Sun, 28 Feb 2021 21:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFD56E215;
	Sun, 28 Feb 2021 20:38:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F936E215
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 20:38:20 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id p16so15526460ioj.4
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 12:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DudMVOEYX2Y7amp9oXtBIZUPbp2qejqD/nYF20V+d14=;
 b=QbwjurAHOmMmII7zUXsFxYQ3y7jKwPlx1tLy33LUrLgG0Z0KOhHjP86Mt+riMKUGx6
 IQwh04EeGC39uWG6Y+Dr2r2Dv/7nkf8Fe6LXa5ay+TB7b1hWHkzOKIu6ucXCDKobO+Dw
 dyExEgdxv6HMsriRyZ8ygnCvN966+ptwaNoRZsjWZsqnmGNmWuSSgt7YWK4rY7XPsS0n
 dZSxUpKEEjOdHnD+0TDfK23uAdss2Krxx5onMlNxO7yzTjXxg+IwD4jQ3HED1YyF0bva
 CCR2YzAbvlgU/jwm3pkU+bT2InD/ldH4vGp1k8lj1XYb9KRpTiGrYsfS7mfpkt3HAsHY
 F/mQ==
X-Gm-Message-State: AOAM533CxOOuuPsSNAOu1Sbt6cYuMuIiuFsYOjK+OQy89Tsw2E+Xs1LF
 u0pZwD9M72rRAcsmcMCKXbOkpPwwf0aqim2BUmU=
X-Google-Smtp-Source: ABdhPJwTgBhGN7gvowy7VYVsV5Z4Dek2F7QkUh0i9YJl43r2hxNgxX7vJoXPU3CSMcC3ZHt5vvIuqp/hAmoPmBlwJKI=
X-Received: by 2002:a05:6602:24cb:: with SMTP id
 h11mr11281959ioe.79.1614544698611; 
 Sun, 28 Feb 2021 12:38:18 -0800 (PST)
MIME-Version: 1.0
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <56b77cbe-6ace-6850-b26a-a762ae94dbcd@gmail.com>
 <CAKb7UvjYcrqzbyRCZDcO=hA3R4pF2hzEdjqMHgRGuYQPYSqKmQ@mail.gmail.com>
 <a4b52255-5b09-4eaa-8a35-81c1c062b462@gmail.com>
 <CAKb7Uvh5T-B37yTeky7keXYZQEd8B8=sqKbQ7TsD0W83HbanWg@mail.gmail.com>
 <b7f1d101-36e5-c7ef-9b7c-5d4162a8c68b@gmail.com>
In-Reply-To: <b7f1d101-36e5-c7ef-9b7c-5d4162a8c68b@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 28 Feb 2021 15:38:07 -0500
Message-ID: <CAKb7UvgMsjZt+auQ-hSCNv+qQN4B1=VpuFuPZYXWftO5S6y8GA@mail.gmail.com>
To: uwe.sauter.de@gmail.com
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
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU3VuLCBGZWIgMjgsIDIwMjEgYXQgMjoyNCBQTSBVd2UgU2F1dGVyIDx1d2Uuc2F1dGVyLmRl
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4gU3VtbWFyeToKPiA+PiAgICAgICAgICAgICAgICAgICAg
IDUuNC4xMDEgIHwgNS4xMC4xOSAgfCA1LjExLjIKPiA+PiBtb2RldGVzdC02NCAgICAgICBzZWVt
cyBvayB8IHNlZW1zIG9rIHwgc2VlbXMgb2sKPiA+PiBtb2RldGVzdC0xMjggICAgICBzZWVtcyBv
ayB8IHNlZW1zIG9rIHwgc2VlbXMgb2sKPiA+PiBtb2RldGVzdC0yNTYgICAgICBzbGljZWQgICB8
IHNsaWNlZCAgIHwgc2xpY2VkCj4gPj4gWCBtb3VzZSBwb2ludGVyICAgb2sgICAgICAgfCBvayAg
ICAgICB8IHNsaWNlZAo+ID4+IChtb2Rlc2V0dGluZyBkZHgpCj4gPj4gWCBtb3VzZSBwb2ludGVy
ICAgb2sgICAgICAgfCBvayAgICAgICB8IG9rCj4gPj4gKG5vdXZlYXUgZGR4KQo+Cj4gT25lIG1v
cmUgZGF0YSBwb2ludDoKPiBMaW51cycgdmFuaWxsYSBrZXJuZWwgY29tbWl0IDU2OTVlNTE2MTk3
NDVkNGZlM2VjMjUwNmEyZjBjZDk4MmM1ZTI3YTQgKFNhdCBGZWIgMjcgMDg6Mjk6MDIgMjAyMSAt
MDgwMCkgc2hvd3MgdGhlIHNhbWUKPiBiZWhhdmlvci4KPgo+IEkgY291bGQgdHJ5IHRvIGJpc2Vj
dOKApgoKVGhlcmUncyBub3RoaW5nIHRvIGJpc2VjdC4gVGhlIGlzc3VlIGlzIGV4cG9zZWQgYnkg
YWR2ZXJ0aXNpbmcgMjU2eDI1NgpjdXJzb3JzIGJ5IGRlZmF1bHQuIEJ1dCBvbGRlciBrZXJuZWxz
IHN1cHBvcnRlZCAyNTZ4MjU2IGN1cnNvcnMgYXMKd2VsbCwgd2hpY2ggaXMgd2h5IG1vZGV0ZXN0
IHdhcyBhIGdvb2QgdGVzdCBmb3IgaXQuIG1vZGVzZXR0aW5nIGRkeAp0YWtlcyB0aGUgImRlZmF1
bHQiIGN1cnNvciBzaXplLgoKSXQncyBqdXN0IGEgbWF0dGVyIG9mIGZpZ3VyaW5nIG91dCB3aGlj
aCBoYXJkd2FyZSBoYXMgdGhlIHByb2JsZW0uCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
