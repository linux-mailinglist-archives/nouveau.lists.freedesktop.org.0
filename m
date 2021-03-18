Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F645340C75
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 19:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A346E944;
	Thu, 18 Mar 2021 18:07:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E97D6E944
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616090822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Rx+nwVul0x5gvAgblGTcfm4THJFBM/JLnFq+1419jE=;
 b=gjpxpLGiQh0VJwIjf+DlahetJM5nUcWSYMUsQDmDn8YZJwHOKwxhUqozps200wujGtxDak
 dKMW6yoDS/DFOfdlz0vOORvCHKWogZqJb1dbk4UhgnYko8B26EPi4+BzkJcDlYH3T8p7GQ
 X5+Npxz/AIMM0MTHNZgJuO233yGyB2I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-EB2HjgcMNa-wr6PDnaa2uA-1; Thu, 18 Mar 2021 14:07:00 -0400
X-MC-Unique: EB2HjgcMNa-wr6PDnaa2uA-1
Received: by mail-qt1-f197.google.com with SMTP id m35so18011004qtd.11
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 11:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2Rx+nwVul0x5gvAgblGTcfm4THJFBM/JLnFq+1419jE=;
 b=dIpvlOCHLb/eVvvEFp1R4SD/kASj5mNGrE+6GUnazSaiJ5xJB18O5l39hMG/ulHZ9K
 /feWk0Irgu/NehQcLU58i1bn55CGjD0LZs9WPGyywCA9YktaRuMN2BGE+yajqyFnP9P/
 yRQz5AMHHUdJ2oSsSBNpQAsSBgjdjx629ZQKXe3jrcx+6lpm2iFLtSLYAhhcEN2uALbh
 qAXaZuSanNrxtOq7zo5vLD6zuXGp4TUiba2YT3ZUh6pI0NNzSzlqgplwMR/wbl2acexl
 eFJVZf9COMsbXQHUToxW6++swR5/d9yUYRcmrvv0WSvvF8kNWXxQSj7siF0ONg2Asvaf
 zQaQ==
X-Gm-Message-State: AOAM530H7V9oby4r7/UURWHHxufsAxDBOhrAKHgwcOpN2CvY9YkEZE2r
 mke/Hc1Yj12GYkeVvvOAANIreA10j3xEepyACGkjUfFjjgOAtbZKu3apUWTaEMX0VLa/r6K+Yfj
 l1LiPTKsyHwQukiyxr6SGt3MoYg==
X-Received: by 2002:ae9:df46:: with SMTP id t67mr5584402qkf.269.1616090819938; 
 Thu, 18 Mar 2021 11:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLnMMjILsyiTKl4O+ac7F90UMNkezjnmTIOI9Q7pZTXy3Lb2S7Umkza94M495XP2hKzdPdqg==
X-Received: by 2002:ae9:df46:: with SMTP id t67mr5584390qkf.269.1616090819779; 
 Thu, 18 Mar 2021 11:06:59 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k28sm2308015qki.101.2021.03.18.11.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 11:06:58 -0700 (PDT)
Message-ID: <28908b23aecc3d340ba14ec42896eea933b9d959.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Martin Peres <martin.peres@mupuf.org>
Date: Thu, 18 Mar 2021 14:06:58 -0400
In-Reply-To: <YFNJ96fvZpNKtRGv@intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
 <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
 <YFNJ96fvZpNKtRGv@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test
 32x32 cursors
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Petri Latvala <petri.latvala@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAzLTE4IGF0IDE0OjM5ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVGh1LCBNYXIgMTgsIDIwMjEgYXQgMDg6Mzk6MDFBTSArMDIwMCwgTWFydGluIFBlcmVz
IHdyb3RlOgo+ID4gT24gMTgvMDMvMjAyMSAwMDo0NSwgTHl1ZGUgd3JvdGU6Cj4gPiA+IEZyb206
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiA+IAo+ID4gPiBTaW5jZSBwcmUtbnZl
NCBvbmx5IGhhcyB0d28gY3Vyc29yIHNpemVzICgzMngzMiBhbmQgNjR4NjQpLCB3ZSBzaG91bGQg
YXQKPiA+ID4gbGVhc3QgdGVzdCBib3RoIG9mIHRoZW0uCj4gPiAKPiA+IFRoaXMgYWRkcyAzNiBz
dWJ0ZXN0cywgd2hpY2ggdGFrZSBhYm91dCAxcyBpbiBhdmVyYWdlLiBTbyB0aGUgcnVudGltZSBp
cyAKPiA+IG5vdCBzaWduaWZpY2FudGx5IGluY3JlYXNlZCBvbiB0aGUgSW50ZWwgc2lkZS4KPiA+
IAo+ID4gSXQgYWxzbyBzZWVtcyB0aGF0IEludGVsIHNob3VsZCBhZGQgc2tpcHMgb3IgZml4IHRo
ZSBrZXJuZWwgdG8gc3VwcG9ydCAKPiA+IHRoZXNlIDMyeFhYIGZvcm1hdC4KPiAKPiBJbnRlbCBo
dyBhdCBsZWFzdCBkb2VzIG5vdCBzdXBwb3J0IDMyeDMyIGN1cnNvcnMuIFdlIHNob3VsZAo+IHBy
b2JhYmx5IGp1c3QganVzdCBwcm9iZSB0aGUga2VybmVsIHRvIHNlZSBpZiBpdCBhY2NlcHRzIHRo
ZQo+IHJlcXVlc3RlZCBjdXJzb3Igc2l6ZSwgYW5kIHNraXAgdGhlIHN1YnRlc3QgaWYgbm90LiBU
aGF0Cj4gd291bGQgYWxzbyBsZXQgdXMgcmVtb3ZlIHRoZSBpOTE1IHBsYXRmb3JtIHNwZWNpZmlj
IGluZm9ybWF0aW9uCj4gZnJvbSBoYXNfbm9uc3F1YXJlX2N1cnNvcnMoKS4KCnNndG0sIHdpbGwg
cmVzcGluIHdpdGggdGhlc2UgY2hhbmdlcyBpbiBqdXN0IGEgbW9tZW50Cj4gCgotLSAKU2luY2Vy
ZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQg
SGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qg
b2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3
YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3Qg
cmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVy
IGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
