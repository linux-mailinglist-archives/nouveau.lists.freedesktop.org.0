Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D581CB041
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 15:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895926EB1B;
	Fri,  8 May 2020 13:27:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A4C6E1D5
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 13:27:49 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id w68so399508vke.5
 for <nouveau@lists.freedesktop.org>; Fri, 08 May 2020 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EZJE/tPJ8tQLpvuI+/lAhJQfail1swVJXWordCz9etM=;
 b=KB6Lc6JUCxwt6Gxnh22L81A6w2vzfO6lAyUl2HEEMoPWTceArwcNj+ykg9OAAeH9dM
 M4ycoFOJ9r8tW1XCgFWWP76n2E919Gw7mi3GRlIv0PBCAReKYbw2tt+6O9+O34f94AWI
 7K/Q8ZdHm4cTrzQOZGw6OCQZVLomQZ4EGddwCoyXyYok0XEwOBQHgiF5evxY7lVu3eQC
 BN5iKGhnUuStmsGmB+pRCLUtrMpXB7guMJA3DbKmp6jYvipDOm2Hmla5Oy6LVfPQKmpZ
 06xXzjjxMUcVaLgEJFWnPt8RKd/OGJtO7R8I+TPwOZqngLY2CKvIARPJ7BVVeaUZL53H
 s3PQ==
X-Gm-Message-State: AGi0PuaX/V9uE2yZXEVKnm2xnPwB0i4bOHmg7YFiHXmdWTVbYDB24xPe
 oslV7TgHnx7j7+K6j5kOmtIodAm6XX12bTee9bcJdSy5
X-Google-Smtp-Source: APiQypI3SfQPCAWyJ4G1bcmnIS2cX7aowcZVg9ZY617bqM+4CdSwAkOGTj6ag/ehCUomtopc2iU5wPYPz+Y5KMk9bNQ=
X-Received: by 2002:a1f:cd06:: with SMTP id d6mr1805912vkg.94.1588944468408;
 Fri, 08 May 2020 06:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAFCWPPKhbbk=um2pv+ytgd+WVaT+M=-mLXXAR427QgQj=w_q3A@mail.gmail.com>
In-Reply-To: <CAFCWPPKhbbk=um2pv+ytgd+WVaT+M=-mLXXAR427QgQj=w_q3A@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 8 May 2020 09:27:37 -0400
Message-ID: <CAKb7Uvi7-UCoEb7GJmT2CseMkhrkg4wO5vfk06KhrVWYfAP9WQ@mail.gmail.com>
To: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Subject: Re: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgOCwgMjAyMCBhdCA0OjM0IEFNIE1pbGFuIEJ1xaFrYSA8bWlsYW4uYnVza2FA
Z21haWwuY29tPiB3cm90ZToKPgo+IEdvb2QgZGF5Lgo+IEknbSBub3QgYSBwcm9ncmFtbWVyLCBz
byBJIGRvbid0IHVuZGVyc3RhbmQuCj4KPiBKdXN0IGEgcXVlc3Rpb246Cj4gV2hhdCdzIHdyb25n
ID0+Cj4gPT4gbm91dmVhdSBkcml2ZXIKPiA9PiBwY2llIGRyaXZlcgo+ID0+IGdyYXBoaWNzIGNh
cmQKPgo+IEl0IHdpbGwgaGVscCBtZSBzYXZlIHVubmVjZXNzYXJ5IGxvc3QgdGltZS4KCk1vc3Qg
bGlrZWx5IHRoZSBpc3N1ZSBpcyBpbiBub3V2ZWF1LiBUaGVyZSdzIGEgbXVjaCBzbWFsbGVyIGxp
a2VsaWhvb2QKdGhhdCB0aGUgaXNzdWUgaXMgd2l0aCBlLmcuIHRoZSBpb21tdS9kbWEtYXBpIGlt
cGxlbWVudGF0aW9uLgoKQ2hlZXJzLAoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUK
