Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED24B22F
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2019 08:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5A46E29C;
	Wed, 19 Jun 2019 06:36:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E196E29C;
 Wed, 19 Jun 2019 06:36:40 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 145so158368pgh.4;
 Tue, 18 Jun 2019 23:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7hSEJgaNQ9TMaenqDYNV1rOFRRbekhYP1C35BGZnzIk=;
 b=TwhNqNE+80y+Sc0AtLtG22RYao9510Yo/VmgZ1osiG+wwMxq2j4GaffTkE/kOM6F3k
 4vidQWeWOXztkHhIt4JlZoDwkKZIADK95i/J1a9NXar3MAUauEOmF99k1fwFF3KUdaIj
 7T+KLXSIgRPdg0rzImiRdyhRWNAEoS6STw9GCOklU6hasU7NpurIdS1DBoPO5MhSkgXG
 nW5gk0mN4Jd4XnaeEAb9urVcBgYOYKSL06pcBba6gdESoGWPuiOGPRcu+bgw5j32T0nt
 hzZSaERJjfCN3jFugJdOcnu/gpwbRRh1C2vZEg0uDhM44DouvgUR1lQIiBwWo/T9kVfv
 ctKw==
X-Gm-Message-State: APjAAAVlq92wbEn5e6VAHCpLIjbBQgr0iAm30i79urYsFy/E7eOxRyHe
 J6CLYOEUminT2Tgj7W1fXWk=
X-Google-Smtp-Source: APXvYqyMWG1Y5CrVeT1G27wZCx7bmh+a8QBDE1WUW1wdkHv4qQJVDts0GqKH1NBdty/xYviDGi2KWg==
X-Received: by 2002:a62:778d:: with SMTP id
 s135mr53470023pfc.204.1560926200153; 
 Tue, 18 Jun 2019 23:36:40 -0700 (PDT)
Received: from localhost ([175.223.10.253])
 by smtp.gmail.com with ESMTPSA id d132sm18688001pfd.61.2019.06.18.23.36.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 23:36:39 -0700 (PDT)
Date: Wed, 19 Jun 2019 15:36:35 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-ID: <20190619063635.GA576@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
 <20190619054826.GA2059@jagdpanzerIV>
 <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
 <20190619062714.GA11457@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619062714.GA11457@jagdpanzerIV>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7hSEJgaNQ9TMaenqDYNV1rOFRRbekhYP1C35BGZnzIk=;
 b=ECyT4hmQ2TVUla0rWPI6s2jkMG691PcNBgN5UZC8rlJxhjIopsi+2ZU1rkQg/4hBJ/
 1DRRnfgKrREBYLmEqtJej1QPvx1WT15tUyGcSsD/piEfS7u1KfGH3/3IFnVCBKvk/+ox
 cwBmuKH7l0vufmNyYI+z0XM12eOViOl7ifEeswyY1IPxXawzGkRSqWv/NWqM1GmzSOvn
 Q9ez1tGX1A62fxOvxYvauaAuO/nJxZy7C4BNh3IpckmnTN93Dvo/7wnfwZMtB4i46JjW
 tz3wadamPlVz7T4xrM5duHtFHLs6SB2BNmvELhflwl++z7T1y2HIGfcONj3Z3mvp8yKs
 eTMw==
Subject: Re: [Nouveau] nouveau: DRM: GPU lockup - switching to software fbcon
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gKDA2LzE5LzE5IDE1OjI3KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IFsuLl0KPiAK
PiA+IElmIGFsbCBlbHNlIGZhaWxzLCBqdXN0IHJlbW92ZSBub3V2ZWF1X2RyaS5zbyBhbmQvb3Ig
Ym9vdCB3aXRoCj4gPiBub3V2ZWF1Lm5vYWNjZWw9MSAtLSBzaG91bGQgYmUgcGVyZmVjdC4KPiAK
PiBDYW4gZ2l2ZSBpdCBhIHRyeS4KClRoYXQgaGFzIHNvbWUgaW1wYWN0IG9uIHN5c3RlbSByZXNw
b25zaXZlbmVzczoKCiBDUFUlCQlDT01NCiAzMzkuNwkJZmlyZWZveAoKV2hpY2ggaXMgc2xpZ2h0
bHkgbGVzcyB0aGFuIHBlcmZlY3QgOikKCgktc3MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
