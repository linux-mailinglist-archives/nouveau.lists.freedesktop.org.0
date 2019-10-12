Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6512B329
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C936E3CB;
	Fri, 27 Dec 2019 08:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 848 seconds by postgrey-1.36 at gabe;
 Sat, 12 Oct 2019 16:18:37 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6346E040
 for <nouveau@lists.freedesktop.org>; Sat, 12 Oct 2019 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1570897115;
 bh=OLEXXVfve/Mn5qOXyqXGU5UQD25/gN2N9FJAnOdynQo=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=nct0rjcc9idOwMLLjDv2d9Fa9bZTjuk9kBCE349ndfPyLGzsjvSRKZM3I7U6CaRxk
 RVGvMtA7lTJUttkYc5aMyuY5/hk5iSUAMFZUQ1NuzcBgVF78fTiNiJi+9F1mes8te0
 cu8a7MIhedgMKsFJzVhwEHThaXvYHOiLqAPRlvao=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.155.250]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MMZck-1iRY9X1pYU-008HQo; Sat, 12
 Oct 2019 18:04:17 +0200
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5ff56ca3-0e20-2820-f981-d2d37dded133@web.de>
Date: Sat, 12 Oct 2019 18:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:eSnIYSIfwQ+qZ88AQSHhpkJEQSkiQV8bWwDZf3F/859qwwhUw2p
 yjCEEUP2esK1O7eoNBr+i2vPIvHTcJKyh/9qIA6rC7yig/ErwTU4gVgD1jwFG72yLowrxvC
 EZ+Xn1E6Br2aEk5op+xfHL+vpOsBkCiP0+GUvtvTyuGYlRhFgLuyj1O8rF2kL6XpwXVdhJ4
 SQOrJ1nQazQiiF3oBgnGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n+JAsfFlKkA=:G/9xW/TqevIO/j0US58JO6
 R/9gOp3SzAV1f/pEn5El2Tr1rSWcB1PC6Afd78G2FuYFuqcotRz0AWvdxBQezrySQaXFJhSq7
 NKkPRbQkQsec3wT7mvLZ00Y41V+CbsjTPDUbTaL7QeqM1C0/06Nj+bagarvDO101LPJsIIZuB
 JizdElG0YgIQtZEbjuT2/BghouoXALHhFi/7dRHabl/PdHEezGCOJTen+eM8RKLfAr2I0h9KV
 YFCNPBGC8bT3Ok1YS2hc3WkmhjFCvpYCku2WRLRJPhD8jl0nqLn8JZ5X1fxEJ/CgeHHXtN2iD
 x0bRFWUtPVs7L4eKrJdPyzfuUmiS+k6AdC2LfaiOr9Wa6RSqnQeF+Rh+TBn7VTKWwFhMI3YJA
 OsoapsKH0wu1z2K6nVVPC3cXyb1QCZTFgnlCmofiPAdYwUYBQeFeUVbF9PJdeMStCQvFUpnkj
 ztYLpx46ZSVXCT3HkZwYAQNiJs5uBrNnFr4XMdciaFvKBy4ALE0i+Sgiq8MHEcVyDdtqvHpg3
 l1UhXBKFNZzSmQaPEF35UZM4nRbVDGv3t8Bd4TWwUI/cplouR83t0XkVzYZ0DkkMP51omzW4x
 7GTw3iOxq8C56DOTR0vtegcHzDTJa6n2Pca0z7WkSxC/Z5U/LwTnaxSFamo/E2w7mZKXYXj/1
 wNbWOX+xxLPWn2foykK+V+eF5o/DBmt4RFGlCz/pJ06EdrQBEAvH/7j1YCKSA7QcZnGBdPHgk
 cpzF17vgjoTF/uAk2jscSKbf23MkXHOM1hCppgGS7iEMgxuOe11/4leoG1YNcAcMrFGYhh9JT
 wqkvihXnRn53kA6wMGpNScWS5aWVwe8hhc3A2Q7WbsN/SeFb2wcu9euh5BIG3jyiky0H0Lp0y
 QzS0IZ4UbUq8A2vNRcSNNcqy3FgpKCBbjwP2lWIp9/osGIJyyLLhb92DARMilLBXB0hQmSoFF
 iB6Ie3oXtHigdqhnL8RtQJXFIPyS0xynJMFuk4X0gnQxejazfFagkyFrbTKSGKTXc7J+iaXJV
 FHZQPmlu/xBSxSJ2UgNEYoxFWfIhKKo+n1ooUtZw0E5EvWMrkHprGjsrIx1ObNRIZY5mp3oRl
 bP447HSSLTgbCxD1FbetP4JWoCHutoOkVV7uVLITKlOuRTz6YplVAS3YJmGYItqx6QajCLXh0
 LMfMA0fnbEh0WNxEUgpLed8R8HwcdHa7L/rnuZJaBxgC+cNr+odgu23s1EKPJAHO4PUMDxvo3
 OwVYgT8b5zqUGOyAD2bE1N6/68+6puszrv62w+2GCwM+xxvquALaH8nmE2uw=
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] drm/nouveau: Checking a kmemdup() call in
 nouveau_connector_of_detect()
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
Cc: kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIHRyaWVkIGFub3RoZXIgc2NyaXB0IGZvciB0aGUgc2VtYW50aWMgcGF0Y2ggbGFu
Z3VhZ2Ugb3V0LgpUaGlzIHNvdXJjZSBjb2RlIGFuYWx5c2lzIGFwcHJvYWNoIHBvaW50cyBvdXQg
dGhhdCB0aGUgaW1wbGVtZW50YXRpb24Kb2YgdGhlIGZ1bmN0aW9uIOKAnG5vdXZlYXVfY29ubmVj
dG9yX29mX2RldGVjdOKAnSBjb250YWlucyBzdGlsbAphbiB1bmNoZWNrZWQgY2FsbCBvZiB0aGUg
ZnVuY3Rpb24g4oCca21lbWR1cOKAnS4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYz9pZD0xYzBjYzVmMWFlNWVlNWE2OTEzNzA0YzBkNzVh
NmU5OTYwNGVlMzBhI240NzYKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNC1y
YzIvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMjTDQ3
NgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBpbXByb3ZlIGl0PwoKUmVnYXJkcywKTWFya3Vz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
