Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35B2D46D
	for <lists+nouveau@lfdr.de>; Wed, 29 May 2019 06:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD376E071;
	Wed, 29 May 2019 04:10:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240989836;
 Mon, 27 May 2019 18:03:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so6967327ljj.4;
 Mon, 27 May 2019 11:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wNFuC91c5YlSB1hcwsQ9GxjfgiwOWc7KaX4c/hxk/s=;
 b=JuQGoYKWmdiYBaDJdvLn6EGXRXbqKQGp2itV39yBNu1NhhPEm3veczGBwVB39WMjRZ
 NIoBPYJTuzyzWD7YsSCWqquYEjM2Ni1azavcO9OuiCFX0m9MAyn384xrBEY+QXi2M6C/
 AVXTGvuaV7hAdHKK6JRk/ccLi0jDw127DofrkgG65BOBEWm9k9wArURO1aLLWSKF03Ls
 dJgACTyhF25pNQY0ceJdPr+lOXVrlNDfauDQZ45VXGiHNyuvtCH+6Sv8C71zza2/SwSB
 rA77vh90lIqmFWG3lB1YSTJznziCdM/D9Jmq3nCn+uEnAmFR30E9qvvCsmHU/7DBy/u4
 dLtA==
X-Gm-Message-State: APjAAAVzgaUsZydYr/Gqt44EUtD8bJFEYPMT3RtdLznieagglM7FsmCU
 XupIAKB712B6x8FIQdqQUAO3zC8XAdOf/jkq+UE=
X-Google-Smtp-Source: APXvYqzKN6/qez+afD6DmlVqDRy1CUBvwTyZWvhzopa5q+smvOT+3QEtqbHtV7E5lx7Um2VvQ5LSZ5SibgQ1nf/Xmoo=
X-Received: by 2002:a2e:3818:: with SMTP id f24mr35962218lja.13.1558980220290; 
 Mon, 27 May 2019 11:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 27 May 2019 23:33:28 +0530
Message-ID: <CAFqt6zaVp5nvuz65tiaBisnoRpXrjpQf7Y4bc_Eyt0-pcOYvrA@mail.gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
X-Mailman-Approved-At: Wed, 29 May 2019 04:10:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+wNFuC91c5YlSB1hcwsQ9GxjfgiwOWc7KaX4c/hxk/s=;
 b=qGzb3KcShEQWnth+drQ8SaRGF84WheM6+KcQcL4T/eN0NPIBQ5Nn1KYiKRwJu3N7MH
 tB0FwugQd2qWrAYcHB/m6NkJEvaj0e0OvgtZ0sj+ZE2+LuDgC73e7+g/7FeCC0FQkwXT
 cVeSracUaAWpII6gQdqJ9LHRSi5t7ME94XduStkE/Y1w+/w6T0z6tkE1nrWAwVeXWVq3
 Gh3cNn2KxW8CPhs/A5OmaRU8Ve2ES3EUgOaOoBmGgFnFrdVBmDkTx48NTbAmPBRiSYlw
 jwudjg6LGBc5aZlKuamkJqqqsxfbb2Lu3M+SazM6xU4tTHJy+esfiLhQuf+ymtgiYssb
 LiWQ==
Subject: Re: [Nouveau] [PATCH] drm/nouveau/svm: Convert to use
 hmm_range_fault()
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTI6MjcgQU0gU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29udmVydCB0byB1c2UgaG1tX3JhbmdlX2ZhdWx0
KCkuCgpBbnkgY29tbWVudCBvbiB0aGlzIHBhdGNoID8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBTb3Vw
dGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
c3ZtLmMKPiBpbmRleCA5M2VkNDNjLi44ZDU2YmQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3N2bS5jCj4gQEAgLTY0OSw3ICs2NDksNyBAQCBzdHJ1Y3Qgbm91dmVhdV9zdm1t
IHsKPiAgICAgICAgICAgICAgICAgcmFuZ2UudmFsdWVzID0gbm91dmVhdV9zdm1fcGZuX3ZhbHVl
czsKPiAgICAgICAgICAgICAgICAgcmFuZ2UucGZuX3NoaWZ0ID0gTlZJRl9WTU1fUEZOTUFQX1Yw
X0FERFJfU0hJRlQ7Cj4gIGFnYWluOgo+IC0gICAgICAgICAgICAgICByZXQgPSBobW1fdm1hX2Zh
dWx0KCZyYW5nZSwgdHJ1ZSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGhtbV9yYW5nZV9mYXVs
dCgmcmFuZ2UsIHRydWUpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0ID09IDApIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFobW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlKSkgewo+IC0tCj4g
MS45LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
