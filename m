Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EA6F840
	for <lists+nouveau@lfdr.de>; Mon, 22 Jul 2019 06:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305A89A94;
	Mon, 22 Jul 2019 04:09:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982D289A94
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jul 2019 04:09:12 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id j2so14781740uaq.5
 for <nouveau@lists.freedesktop.org>; Sun, 21 Jul 2019 21:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sX6kCH/f4svNp3hJ928tzzPbLq2sSf2fqCQZN/4aoyc=;
 b=dFhVR+iAlEQJRduuCH/udUQtwgUeq3+D/8CMZ8j4xqGfnP1q5TulOLr6iR7Rx0FTEe
 59vGLwbgkO2XK6jJ8fvzsEvOqytYpfAp5otA8QeTA7tocyWU4JiES6W/NEI3DMG+yPDq
 ju5dGk6+fhDj8swaEpsVwUdj3ILU3O4NnaP4VWQMvzgbDpnlK5P9ik07p7Dsi0cGCaN+
 IicrxoArl92Mr77eBFVfHHjf2aTccgRi5wNWHB9dodfNA+mKp6+Yiav82RxyML5bO9ij
 UskllmTjhrQjiLBZ7G9vlQfwnzD/4qLL7kiuVIXdRIKFXzZMZJC+h2/wcQIBRMEfqsph
 AQUw==
X-Gm-Message-State: APjAAAWa82AhqcG/HdlMOaqo3IDY3lRxFLFBqWlSxdW9qnU3mOt/zuob
 hPZeZvQ5NmUDKNa6R+3ImxqMf/MwL+xC0M2b6no=
X-Google-Smtp-Source: APXvYqyT1IrbEtzMU9u7jWXG8JnV+KIpJNPRAtoXwxz4GMvUyLSMv+ujum081es6KcCi2B0cMdRCMwxeVqP8/b0GdX8=
X-Received: by 2002:a9f:25c6:: with SMTP id 64mr291910uaf.36.1563768551723;
 Sun, 21 Jul 2019 21:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190718080741.3147-1-mmenzyns@redhat.com>
In-Reply-To: <20190718080741.3147-1-mmenzyns@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 22 Jul 2019 14:09:00 +1000
Message-ID: <CACAvsv4JXDbHHHazho4bBewcP02WvKxZBmr=PwbEH-7X3jC38Q@mail.gmail.com>
To: Mark Menzynski <mmenzyns@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sX6kCH/f4svNp3hJ928tzzPbLq2sSf2fqCQZN/4aoyc=;
 b=hGVORt74H/hj3QyxfUEdNF75bT8KBhLMPJWUUhu2RJf91XnG0n31Mp4AhZ2aXzK70y
 oWF8LojYKd8WXH3nP8cCZ5ziosLgJdZIgIq3TNeLPAolHfBpcK1++MCHwGGW6a00YFVr
 wceFqSc06Uv88EPzN2TUUqzeYMt+cYqImpjtTDg7ji6eyI3UQTfsIPUT0IjbORCbjy2r
 EdrTV10Izyb5h0cQE3hHH80S2PXzgGIclokpn6I/2oHPXkmyJIRmZ1mm0gpjdCYNvHYP
 9lXRqf1LGkbwUpr2YYF2NmJQaVt+fHi+Gj54UT2sFDmzgawnZs3rlxfdPvVm01/RtyqJ
 JYEA==
Subject: Re: [Nouveau] [PATCH v3 0/4] Refuse to load if power cable are not
 connected
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSd2ZSBtZXJnZWQgdGhlc2UgcGF0Y2hlcyB0byBteSB0cmVlLgoKVGhhbmsgeW91LApCZW4uCgpP
biBUaHUsIDE4IEp1bCAyMDE5IGF0IDE4OjA3LCBNYXJrIE1lbnp5bnNraSA8bW1lbnp5bnNAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBBZGRlZCBjb25maWcgb3ZlcnJpZGUgZm9yIHBvd2VyIGNoZWNr
cy4KPgo+IE1hcmsgTWVuenluc2tpICg0KToKPiAgIGJpb3MvZ3Bpbzogc29ydCBncGlvcyBieSB2
YWx1ZXMKPiAgIGdwaW86IGZhaWwgaWYgZ3B1IGV4dGVybmFsIHBvd2VyIGlzIG1pc3NpbmcKPiAg
IGdwaW86IGNoZWNrIHRoZSBncGlvIGZ1bmN0aW9uIDE2IGluIHRoZSBwb3dlciBjaGVjayBhcyB3
ZWxsCj4gICBncGlvOiBjaGVjayBmdW5jdGlvbiA3NiBpbiB0aGUgcG93ZXIgY2hlY2sgYXMgd2Vs
bAo+Cj4gIGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggfCAgNSAr
KystCj4gIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jICAgICAgICAgfCAzMiAr
KysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiAtLQo+IDIuMjEuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
