Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC02F8702
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 22:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9889FCA;
	Fri, 15 Jan 2021 21:01:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB45789FCA
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610744463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obI/JRWdUSvZNr5QqIMBiKWw8kogCSs64oAUNgS11HU=;
 b=Z7L18uCvmPMLBu/d24yfgPxYU9egfE0k26NLwr9OBSxCHpaCOHZAd7Bsq9nV0XDxe8nGv2
 9g7O53MhusjEJAe8KaaZZbC/uiokV3+D/S4mllRzE1JoD4DCP8dSWa3HaD7hpgPS9EZvyh
 PJL3kwicjrIjxkoQerOut8XrDDV2f44=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-goeOqX_iOta4N43edJVtaA-1; Fri, 15 Jan 2021 16:01:02 -0500
X-MC-Unique: goeOqX_iOta4N43edJVtaA-1
Received: by mail-qk1-f197.google.com with SMTP id s66so9208355qkh.10
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 13:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=obI/JRWdUSvZNr5QqIMBiKWw8kogCSs64oAUNgS11HU=;
 b=I7yhLZf1cYTsf+Is4z2I5O7ybhgOU3u+kMFt7ngv/SyWj8f94b2eXXGLK+M+XZLfLi
 sj7crEWSjYVAmtVTmpcbfqR/qlkDE5GiXVXIj3+wLtjoIBkD1j9h0bYKaBqluK+I8Vo5
 8wehJUlijNqTp/LC+uNdI9esOEVMDOg2qzebMpxT97/cE7wXCff32/ckDUyz0QSXEQ7y
 y5QSWKvkdH3Qea40L62Vom8wgp1XLkk/kVPtBnwqbgvzzr5j8vQW5Ry+Z0zixX7Fm/du
 lrs42LmlJKcxp7+yycJV1bcTD61a/Uy6B5I7q/UBINkfh9Rlxw9xPFUOhCpmGH1bHRR2
 lyOQ==
X-Gm-Message-State: AOAM532sxUDuuRtAQ+nvOU341k7Qi9DH6q3UkOwBUusQ+jjVqEdLkGo2
 lDGvAR2pYgTQndnZz0OImVlA+I01CDd7S1D052ISuSP/w4oWwbAXJqOHP5kJEP4J3RJlmLnH2Iy
 66OQMQj5Y6NC4j73f8QHxKfWxJQ==
X-Received: by 2002:a05:620a:1206:: with SMTP id
 u6mr13921649qkj.209.1610744461598; 
 Fri, 15 Jan 2021 13:01:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVh2+8J55Enbs15+Hw/YSuLScYMEteiX2bss9cdJXMZE2gP55t3eyCjmDyBeCdWwpNy+cGEA==
X-Received: by 2002:a05:620a:1206:: with SMTP id
 u6mr13921626qkj.209.1610744461420; 
 Fri, 15 Jan 2021 13:01:01 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e1sm136768qkd.135.2021.01.15.13.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:01:00 -0800 (PST)
Message-ID: <c859de5bf2d279c697c8fb1606b66eca93a87c86.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, nouveau@lists.freedesktop.org
Date: Fri, 15 Jan 2021 16:00:59 -0500
In-Reply-To: <20210114214406.77976-1-contact@emersion.fr>
References: <20210114214406.77976-1-contact@emersion.fr>
Organization: Red Hat
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv50: cleanup on
 nv50_head_atom_get failure
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMjEt
MDEtMTQgYXQgMjI6NDQgKzAxMDAsIFNpbW9uIFNlciB3cm90ZToKPiBXaGVuIG52NTBfaGVhZF9h
dG9tX2dldCBmYWlscywgd2UgbmVlZCB0byB1bi1kbyBldmVyeXRoaW5nIHdlJ3ZlCj4gZG9uZSBz
byBmYXI6IHJlbGVhc2UgdGhlIGZlbmNlIGFuZCB1bnBpbiB0aGUgQk8uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgo+IENjOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
Q2M6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KPiAtLS0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYyB8IDYgKysrKystCj4gwqAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYwo+IGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvd25kdy5jCj4gaW5kZXggMDM1NjQ3NGFkNmY2Li42MGFhYmIxYmMw
OTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jCj4gQEAgLTU2
Miw4ICs1NjIsMTIgQEAgbnY1MF93bmR3X3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsIHN0cnVjdAo+IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKHduZHctPmZ1bmMtPnByZXBhcmUpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGFzeWggPSBudjUwX2hlYWRfYXRvbV9nZXQoYXN5dy0+c3RhdGUuc3RhdGUsIGFzeXct
Cj4gPnN0YXRlLmNydGMpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNf
RVJSKGFzeWgpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGFz
eWgpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
bWFfZmVuY2VfcHV0KGFzeXctPnN0YXRlLmZlbmNlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFzeXctPnN0YXRlLmZlbmNlID0gTlVMTDsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG5vdXZlYXVfYm9fdW5w
aW4obnZibyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIFBUUl9FUlIoYXN5aCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd25kdy0+ZnVuYy0+cHJl
cGFyZSh3bmR3LCBhc3loLCBhc3l3KTsKPiDCoMKgwqDCoMKgwqDCoMKgfQoKLS0gClNpbmNlcmVs
eSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhh
dAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9m
IGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2Fp
dGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJl
c3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBl
bWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
