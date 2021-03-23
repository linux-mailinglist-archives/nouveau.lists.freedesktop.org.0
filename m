Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49F34662A
	for <lists+nouveau@lfdr.de>; Tue, 23 Mar 2021 18:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080E06E929;
	Tue, 23 Mar 2021 17:20:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F2B6EA5A
 for <nouveau@lists.freedesktop.org>; Tue, 23 Mar 2021 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616520052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAyFL6IZIY2oqC27uvurT02K8tPhgIqI61UB1ihbE4M=;
 b=bmvsaTO8VonyT8q5u2lCZ9VkC9vu9S2L9WdPE/fRMu72+nJhE5Pe5u4CATdD6mTEVMMtUf
 6DPIKrMomuhAlGZ9tEhDsGjF3MRbTLLAJ0WIwnzhci7Kev2+Z9qie/YCxoiT8A9vH46HaP
 FW4qq9gay/R77c17FxdAp/YeQ1kskg0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-X1JtysPvM0avHjzuJRUsCg-1; Tue, 23 Mar 2021 13:20:51 -0400
X-MC-Unique: X1JtysPvM0avHjzuJRUsCg-1
Received: by mail-qk1-f197.google.com with SMTP id k188so2481617qkb.5
 for <nouveau@lists.freedesktop.org>; Tue, 23 Mar 2021 10:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YAyFL6IZIY2oqC27uvurT02K8tPhgIqI61UB1ihbE4M=;
 b=ThMfk3AxsgdWWrCtkanF+zd+hCP9q1oAGiRTstxFp/3w8G4ktdogXB5V5kLnsOCYt2
 alec07CkZ4lrRgcVaEd6NAppPLYDniiz+7BZ/0A77yfJSL9CxEvxVHpDMDGicwvqGSi5
 Dvq8clrkTeYmAJlo1dsVT/xrGynqXpPJOGyWeTFTMSnZv1zlDHp9iDil7RmgRMP3IfWW
 WuxkE3QKgL2JkrrxUKBYsDh1/mLJs4VLlDBMV0+R7RB9Q247MGF/CK1P0Q63lZ0eGxVI
 FAAk1jUjgW+6jHGeiMUtblqB1A6pPWiDqDJ21RJIop+8Qav6rA0mTBiNaomhmxaPOp0g
 289Q==
X-Gm-Message-State: AOAM532bRZ89nhOgN8Q8h2hhLOELgSVvNiFF3rw7VqimTwPQb/BGrJk9
 NV2vsTJGZa7QjazMqgT9/zC0zGikVUtxInR4y2bZfLLcSTJEWVGYARc61G1o9grRLkj3FW6lFhJ
 9VphK14Cfs/n+O53zxW+0iKIePg==
X-Received: by 2002:ac8:7b3a:: with SMTP id l26mr5459631qtu.150.1616520049925; 
 Tue, 23 Mar 2021 10:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztYTHgeNEkdPAMioM0BwWW+Vm6mK0rE7umTqs7yzRlDH9oowzpWEj8LVq6M8gu2Op7eNL4Aw==
X-Received: by 2002:ac8:7b3a:: with SMTP id l26mr5459610qtu.150.1616520049760; 
 Tue, 23 Mar 2021 10:20:49 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x14sm13757985qkx.112.2021.03.23.10.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 10:20:49 -0700 (PDT)
Message-ID: <fa6903109e07ba8d3f1d5374d1785e3d8df10ebb.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Wan Jiabing <wanjiabing@vivo.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 23 Mar 2021 13:20:48 -0400
In-Reply-To: <20210322124513.130470-1-wanjiabing@vivo.com>
References: <20210322124513.130470-1-wanjiabing@vivo.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drivers: gpu: priv.h is included twice
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
Reply-To: lyude@redhat.com
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjEt
MDMtMjIgYXQgMjA6NDUgKzA4MDAsIFdhbiBKaWFiaW5nIHdyb3RlOgo+IHByaXYuaCBoYXMgYmVl
biBpbmNsdWRlZCBhdCBsaW5lIDIyLCBzbyByZW1vdmUKPiB0aGUgZHVwbGljYXRlIGluY2x1ZGUg
YXQgbGluZSAyNC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYW4gSmlhYmluZyA8d2FuamlhYmluZ0B2
aXZvLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL252
ZW5jL2Jhc2UuYyB8IDIgLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9udmVuYy9i
YXNlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL252ZW5jL2Jhc2Uu
Ywo+IGluZGV4IGMzOWU3OTdkYzdjOS4uMDk1MjQxNjg0MzFjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL252ZW5jL2Jhc2UuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL252ZW5jL2Jhc2UuYwo+IEBAIC0yMCw4ICsy
MCw2IEBACj4gwqAgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4gwqAgKi8KPiDC
oCNpbmNsdWRlICJwcml2LmgiCj4gLQo+IC0jaW5jbHVkZSAicHJpdi5oIgo+IMKgI2luY2x1ZGUg
PGNvcmUvZmlybXdhcmUuaD4KPiDCoAo+IMKgc3RhdGljIHZvaWQgKgoKLS0gClNpbmNlcmVseSwK
ICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAog
ICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1
Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGlu
ZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3Bv
bmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFp
bCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
