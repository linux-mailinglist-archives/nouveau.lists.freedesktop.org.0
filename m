Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7488DC3B
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 19:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66E6E7AB;
	Wed, 14 Aug 2019 17:49:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980896E7AC
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 17:49:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z51so23184471edz.13
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 10:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Hb464daFGycQhSgA9BEwjg8HNKIy+QMbts1XhF2KkhY=;
 b=Ezvo6zQ8OellmDv6u+4yOBWjlJ9sBjP7JKO5XZBn4lBEI7LAMqBW9Rk4piS7nJUeTp
 7gy5QSMNtP4z2I/AtCMFE8SO1z8qp5QOkA1/o9Qd4FILIJjkEip5fIjU5R7xEfWjD4hw
 14w3pUNy8CwUsNMsQSYBM7zQEyJwd9KUryId9f0Fse0Vubb7iOiJGXDl2IAEPPPKj+0D
 tBr0qA+z4NPjrjy8bFoveZJY3ERiCAxsnfWYPQIbalSOGZN+fRivkqCxnQxUTP/WdatU
 sR6B4Hsunul04TpsfjUyXoBWdBe1lJfTLNGWc8yCvZxNXuj0Dm3OybMVH/rDgch6Q4Ej
 bUsg==
X-Gm-Message-State: APjAAAVU4i9Kzycd3Tb8tG74w8u9UYx74wNJHDQxkZ/aPOZfmx0W9oMv
 VTr4L7Lr9HDCypHfOsYu3wlCbg==
X-Google-Smtp-Source: APXvYqwBl2F3g+zroJnkq4eZ/+bHbYQoVu/ZDXQOMXZayvH7IQw3wqGZbNdQii7iJcpfIK39yqAZTQ==
X-Received: by 2002:a17:906:7681:: with SMTP id
 o1mr710091ejm.207.1565804970147; 
 Wed, 14 Aug 2019 10:49:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b17sm81942edy.43.2019.08.14.10.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:49:29 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:49:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Message-ID: <20190814174927.GT7444@phenom.ffwll.local>
Mail-Followup-To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20190814145033.GA11190@Red>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814145033.GA11190@Red>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hb464daFGycQhSgA9BEwjg8HNKIy+QMbts1XhF2KkhY=;
 b=XbdmfFcT3jnZqRlVTGuaAFo1OtCPLWFWljVro0mfCdbdxEefp8fNvLYheP9O/U9RZ5
 YWZ3imdFdL067IfOXnulKaXhUdDc+FcfNtu2hXsJNTM3bqKaa2YWSCA2NxFoIkrLyN7v
 daxCcz4A95TTfgIwKhFdy5WvEkqqbj31ATPN8=
Subject: Re: [Nouveau] DMA-API: cacheline tracking ENOMEM,
 dma-debug disabled due to nouveau ?
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, bskeggs@redhat.com, daniel@ffwll.ch,
 robin.murphy@arm.com, hch@lst.de, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDQ6NTA6MzNQTSArMDIwMCwgQ29yZW50aW4gTGFiYmUg
d3JvdGU6Cj4gSGVsbG8KPiAKPiBTaW5jZSBsb3Qgb2YgcmVsZWFzZSAoYXQgbGVhc3Qgc2luY2Ug
NC4xOSksIEkgaGl0IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToKPiBETUEtQVBJOiBjYWNo
ZWxpbmUgdHJhY2tpbmcgRU5PTUVNLCBkbWEtZGVidWcgZGlzYWJsZWQKPiAKPiBBZnRlciBoaXR0
aW5nIHRoYXQsIEkgdHJ5IHRvIGNoZWNrIHdobyBpcyBjcmVhdGluZyBzbyBtYW55IERNQSBtYXBw
aW5nIGFuZCBzZWU6Cj4gY2F0IC9zeXMva2VybmVsL2RlYnVnL2RtYS1hcGkvZHVtcCB8IGN1dCAt
ZCcgJyAtZjIgfCBzb3J0IHwgdW5pcSAtYwo+ICAgICAgIDYgYWhjaQo+ICAgICAyNTcgZTEwMDBl
Cj4gICAgICAgNiBlaGNpLXBjaQo+ICAgIDU4OTEgbm91dmVhdQo+ICAgICAgMjQgdWhjaV9oY2QK
PiAKPiBEb2VzIG5vdXZlYXUgaGF2aW5nIHRoaXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcg
aXMgbm9ybWFsID8KClllYWggc2VlbXMgcGVyZmVjdGx5IGZpbmUgZm9yIGEgZ3B1LgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
