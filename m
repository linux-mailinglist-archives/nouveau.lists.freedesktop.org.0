Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD634106C
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 23:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09CD6E1BC;
	Thu, 18 Mar 2021 22:39:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647DE6E1B3
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616107160;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGOHq/WbcE/FK7Ks4LiyUfXGKcEUtRkPJeBWF/9F28c=;
 b=IBXU5zNE5nVzGkztVFK1/Me2DrB5o0c9HDLmo9H2bT7/Pz8RbcfEaEEYWuOeMyWCTErS2b
 /QNtdqsjkoL98+yPqZa3Ilt2cF+GpqNPqGwv3/KKVkja9Q4HORq3VtG8VE2hIZWAkHUjta
 b4YjQB99PrESMmP556iim6nvwmbbwQw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-ZOwa5y7uOT6q1VgJsPc4Xw-1; Thu, 18 Mar 2021 18:39:18 -0400
X-MC-Unique: ZOwa5y7uOT6q1VgJsPc4Xw-1
Received: by mail-qv1-f71.google.com with SMTP id t18so30801861qva.6
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 15:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oGOHq/WbcE/FK7Ks4LiyUfXGKcEUtRkPJeBWF/9F28c=;
 b=Fv5hSiXvxY4SO4j04uokuVXdekJRzXLfXyXDlAXVsO3BQOMuhEZTITOi2OmRwUuflQ
 sz/syoLe5Y7ZCcQRm2BQA+DdH2NcAZhXCxSXCyPjIvhcCoGoKYdaEQZ2ApXhpzt/d9B+
 ex81MjCFumFObwxEqN3fQmL/BiphieGB6tigN2FRJnaopDx7iMUb5clV2TbzTVdWrvmb
 NsdmiRyUUbFOimMySYRErSdziOrGADaeecIDJI+wGwve2pfUJTfqfXBMxvzGK26WKghK
 bM/1V/XjuSFmKbWCCNkkx17mgGk5yGTQvh/nbMOprL6HyYYAy7bUgQK+DqPm0mSR0G5c
 YkKw==
X-Gm-Message-State: AOAM532OZsSWER7JF0/rBu12ppBfAB2VcJsoR5DSpvO8jPZE+SnlIV/r
 nhH4kC9r0yAHzSBNY79Idc+dq4HV/5KICtJGfb7XwwEJHpm+odF1P9miEll/OjRjrMqXIKmPbS7
 MTdGD/+5ZYFfK01y+jBXGXEFcPw==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr6906149qkk.96.1616107158223; 
 Thu, 18 Mar 2021 15:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydzeTIFW5JZKSCJS0r2r5PeTzveIrvq8RZJWfkRgUk7Sjwyc7/hRalxGMlgbxkBUXrdV+tHQ==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr6906125qkk.96.1616107157990; 
 Thu, 18 Mar 2021 15:39:17 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g11sm2961582qkk.5.2021.03.18.15.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 15:39:17 -0700 (PDT)
Message-ID: <e26fac2f5750f4bd606cdbf9def82a3ee31db71c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 18 Mar 2021 18:39:16 -0400
In-Reply-To: <CAKb7UviTpAva-kc4-=1oCV_CxHJrZE7mWec0rNrgQ4r-RG8e7w@mail.gmail.com>
References: <20210318215545.901756-1-lyude@redhat.com>
 <CAKb7UviTpAva-kc4-=1oCV_CxHJrZE7mWec0rNrgQ4r-RG8e7w@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Check plane size for
 cursors, not fb size
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAzLTE4IGF0IDE4OjEzIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBUaHUsIE1hciAxOCwgMjAyMSBhdCA1OjU2IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gCj4gPiBGb3VuZCB0aGlzIHdoaWxlIHRyeWluZyB0byBtYWtlIHNvbWUg
Y2hhbmdlcyB0byB0aGUga21zX2N1cnNvcl9jcmMgdGVzdC4KPiA+IGN1cnM1MDdhX2FjcXVpcmUg
Y2hlY2tzIHRoYXQgdGhlIHdpZHRoIGFuZCBoZWlnaHQgb2YgdGhlIGN1cnNvciBmcmFtZWJ1ZmZl
cgo+ID4gYXJlIGVxdWFsIChhc3l3LT5pbWFnZS57dyxofSkuIFRoaXMgaXMgYWN0dWFsbHkgd3Jv
bmcgdGhvdWdoLCBhcyB3ZSBvbmx5Cj4gPiB3YW50IHRvIGJlIGNvbmNlcm5lZCB0aGF0IHRoZSBh
Y3R1YWwgd2lkdGgvaGVpZ2h0IG9mIHRoZSBwbGFuZSBhcmUgdGhlCj4gPiBzYW1lLiBJdCdzIGZp
bmUgaWYgd2Ugc2NhbiBvdXQgZnJvbSBhbiBmYiB0aGF0J3Mgc2xpZ2h0bHkgbGFyZ2VyIHRoYW4g
dGhlCj4gPiBjdXJzb3IgcGxhbmUgKGluIGZhY3QsIHNvbWUgaWd0IHRlc3RzIGFjdHVhbGx5IGRv
IHRoaXMpLgo+IAo+IEhvdyBzbz8gVGhlIHNjYW5vdXQgZW5naW5lIGV4cGVjdHMgdGhlIGRhdGEg
dG8gYmUgcGFja2VkLiBIZWlnaHQgY2FuCj4gYmUgbGFyZ2VyLCBidXQgd2lkdGggaGFzIHRvIG1h
dGNoLgoKSHVoIC0gd2Fzbid0IGV4cGVjdGluZyB0aGF0LCBuaWNlIGNhdGNoLiBJJ2xsIGZpeCB0
aGlzIHVwIGluIGEgbW9tZW50Cgo+IAo+IMKgIC1pbGlhCj4gCgotLSAKU2luY2VyZWx5LAogICBM
eXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApO
b3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBv
biBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZv
ciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVk
IGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRv
IGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
