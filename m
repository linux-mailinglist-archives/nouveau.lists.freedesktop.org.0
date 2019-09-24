Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917DBC7C6
	for <lists+nouveau@lfdr.de>; Tue, 24 Sep 2019 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7FF88DAA;
	Tue, 24 Sep 2019 12:19:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F97E88DAA;
 Tue, 24 Sep 2019 12:19:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id f22so1795549wmc.2;
 Tue, 24 Sep 2019 05:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:from:subject:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=qqsUOw2krpMD24Njmh7WxAKsXrtod2P+xLi25XhoPmo=;
 b=qLBMAaJGPqTQF49zwcscKcQTT6LJkIUBXsQH3M7e+DnkfFppX/ZVjIvVsxJd7X+lvS
 tgErlnjGu+ENSjEISUgfionrdiyLIbR1NlmJxkEcePSqGnksI34Z81QS7JgRXTOF0mSK
 SHxaClyz9lbR0eg5CsVbFhnEfOGO2ilqa0E6KWopdjrfy9tMrLlBKRUX15HI7CrcSqTt
 pOIkOIVnryIdSv+HsYvJ+yY5e4T7yZe/TyDH/+s/+DyRs7GdrVTapznb5Cd1SKlVa/bJ
 en5Tw0u0Zx8U/sQm9O8aA/nsnYp3ytuiIMUvZ0M57QpmbFMUIudeIv6Ct6XHlrFa6YpW
 /j2A==
X-Gm-Message-State: APjAAAW0GUJaR38sKkAB88Fjm2R8AUSfrjx401C7AbuQMDAIvszBPehW
 BbM25uOgLsLhu88r3Q1bUZ2uBS4C
X-Google-Smtp-Source: APXvYqxAuGHojnwaaCHjnxiz1YUvXQ2uXu7jpzqiXHaIA5+UjWGRvKK7K1HFiQiCTAuTi+xvHQlU0Q==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr2557800wmd.45.1569327583003; 
 Tue, 24 Sep 2019 05:19:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q192sm4287170wme.23.2019.09.24.05.19.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 05:19:42 -0700 (PDT)
To: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
Date: Tue, 24 Sep 2019 14:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=qqsUOw2krpMD24Njmh7WxAKsXrtod2P+xLi25XhoPmo=;
 b=QhDJlUz8V1WkBMbEie7C7VwnjZFM7DuLKCak0Hp7ef3u2GsvnoPcTL787sPmxzDKgq
 2hv9TyFIuDrDCWMuZKKQQ5GbDfHoc4J9hAZhPXE1eNzmAWJqyw3091SQv8TNNMgvcSGe
 oUbTZiCuhY4Ic9ZlGK9xx7f6X+52N6ptoTjjD0/57PUxVEmZ123oBunmMJp4WJhwEhqX
 52AuvRsVp1LPV33MrdgbJmNn6aXbedi/jL7ghgysZJQI681RqoeAE35R8ZdTlQ3/Est3
 Oca6vvHybVJ9kFLErLyVhkxYRxE7fQXJCSt6iyRBR0xBHKbWrePfVL5MzPUyhL8PLpeA
 41Sw==
Subject: [Nouveau] Is Nouveau really using the io_reserve_lru?
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgZ3V5cywKCndoaWxlIHdvcmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVuY3Rpb25hbGl0
eSBJIHN0dW1ibGVkIG92ZXIgdGhlIAppb19yZXNlcnZlX2xydS4KCkJhc2ljIGlkZWEgaXMgdGhh
dCB3aGVuIHRoaXMgZmxhZyBpcyBzZXQgdGhlIGRyaXZlci0+aW9fbWVtX3Jlc2VydmUoKSAKY2Fs
bGJhY2sgY2FuIHJldHVybiAtRUFHQUlOIHJlc3VsdGluZyBpbiB1bm1hcHBpbmcgb2Ygb3RoZXIg
Qk9zLgoKQnV0IE5vdXZlYXUgZG9lc24ndCBzZWVtIHRvIHJldHVybiAtRUFHQUlOIGluIHRoZSBj
YWxsIHBhdGggb2YgCmlvX21lbV9yZXNlcnZlIGFueXdoZXJlLgoKU28gaXMgdGhpcyB1bnVzZWQg
b3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClJlZ2FyZHMsCkNocmlzdGlhbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
