Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC583CDF
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 23:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D856E57E;
	Tue,  6 Aug 2019 21:47:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3D96E57E
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 21:47:33 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id m23so59349716vso.1
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 14:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxYHCEE4bTh6DnGk5pZJKvebQ2LYr9U0hazGUluMIhc=;
 b=phB+bcHjNuN+hKzBWUko/k6Qy2DqmUY1SntpqVd1zjoGAjjmZUGStL8xqc6bjzj8Pb
 gV7V/xVKyvlcRZjSmhg2sSJgkMFXiWaGfG3xUQO+iNbMVWXPytZlIETk0rpd4TWWLerf
 g3dGpRb5N6e8jfsyoydSm3fPwS4kjDh9Y3YviEez3DaUCBCzpQfOml5YmwqnZr/KCur6
 BFDRruTJwGaFHjwGbNc/Py476cNckpxTf2GBKUwTrEGCR2uVKUlOUS2hb8J4wxCO8xkk
 c6fmVb8OIdsyNZ8JTZHe00TfD6XL619DChh0iPONB3ZxVTk98sBEXbP558EFMlFqBaPk
 t2SA==
X-Gm-Message-State: APjAAAVd1cHcyF0I3237/A08YTIk2tSQsw+hZAnuUcdoYzPmuEHHin46
 CAHItpICHal3sjTPxJ0eusiLDm9hryWyKWdVIq9oCg==
X-Google-Smtp-Source: APXvYqxfV+jvB4mE3v2BOp904Yyb5lZ0CxzCQ3/kSuuzwEGrlNKiC0kRwuydwBPAmOgIQPNQAE5Cc9FlSx93o+jIXtM=
X-Received: by 2002:a67:dd0d:: with SMTP id y13mr3641556vsj.210.1565128052569; 
 Tue, 06 Aug 2019 14:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <qic915$1j2$1@blaine.gmane.org>
 <CAKb7Uvg-7UVzYJXy3YBpV038yfsZx2hx-LZ7omR9HnCiZwYmXA@mail.gmail.com>
 <qicbpr$6q56$1@blaine.gmane.org> <qicci7$9ci$1@blaine.gmane.org>
 <CAKb7Uvgnegj15BMoUoH9UT1oP6e4+KHxUShwpMTnu1U5xOu9_A@mail.gmail.com>
 <16c68653940.279c.665a3322dda79c663fe860d9fff7dd5d@lockie.ca>
 <qicr8j$aar$1@blaine.gmane.org>
In-Reply-To: <qicr8j$aar$1@blaine.gmane.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 6 Aug 2019 17:47:21 -0400
Message-ID: <CAKb7UvhhuHd9uzsn5QtPDG3gfWd0FwCceTxr2nGwdzgD9n7Yuw@mail.gmail.com>
To: James <bjlockie@lockie.ca>
Subject: Re: [Nouveau] unstable refresh rate
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhhdCdzIE9LIC0gbm91dmVhdSBkb2Vzbid0IGxldCB5b3UgcGljayBiaXQgZGVwdGggZWl0aGVy
ICh5ZXQpLiBJdCdzCmFsbCA4YnBjIC0gaGlnaGVyIGJwYyBtb2RlIHN1cHBvcnQgd2lsbCBjb21l
IC4uLiBldmVudHVhbGx5LgoKT24gVHVlLCBBdWcgNiwgMjAxOSBhdCA1OjI1IFBNIEphbWVzIDxi
amxvY2tpZUBsb2NraWUuY2E+IHdyb3RlOgo+Cj4gSSB0aGluayBJIG1heSBoYXZlIHVwZGF0ZWQg
dGhlIHR2IGZpcm13YXJlIGJldHdlZW4gd2hlbiBpdCB3b3JrZWQgYW5kCj4gd2hlbiBpdCBkaWRu
J3QuCj4gSSB3b25kZXIgaXQgaXQgaGFzIHRvIGRvIHdpdGggYml0IGRlcHRoLgo+IEkgdXNlIGx1
YnVudHUgYW5kIGl0IGRvZXNuJ3QgbGV0IG1lIHBpY2sgdGhlIGJpdCBkZXB0aCBzbyBJIGRvbid0
IGtub3cKPiB3aGF0IGl0IHVzaW5nLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
