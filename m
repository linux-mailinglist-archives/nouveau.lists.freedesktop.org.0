Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E02D9266
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2019 15:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F4898D9;
	Wed, 16 Oct 2019 13:25:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB92898D9
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2019 13:25:34 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-oZbsjFy8OGCOSMxmRq-R7w-1; Wed, 16 Oct 2019 09:25:30 -0400
Received: by mail-qt1-f199.google.com with SMTP id d6so24947219qtn.2
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2019 06:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPltsrnI8vyU3agfCq/XZjNM/t3tdsL0bhgMt++hRF0=;
 b=OwFbTsKrq3jt4bQBCwzV7IRwPchOe+Xy5vvpNK5JRONuLunNUee7fGu2SH4NTXbfcs
 Ae7NzNl2UfDmCJFX5Lcre4RZmpu8M9QUKiYh85JuzMNMbRpFjvNXxy9vV1X+LQt76Qkv
 fk74SqE1HN/kgWFyo8ne1EbG6xD5aN0SacISv4uKSGKe2ErJYe18IvBsfTauvmCy0/Iz
 vYrJ7zTMvaN8p/PQlJtug/7cvQ3pvwGw4xvEjGqC8U0Uqe8xKFQ30vLSkBrd5g5Pe5JB
 Yk+xCWLNavsJqNDSUa3Foe6jSWVP4P+X+WZAyW4y6R3XqfPpp6EfvKhXqGKAMpBQ20gb
 HHsg==
X-Gm-Message-State: APjAAAUk3ZU8nGjs1b/UXnMA8KpjDlVIIh/DB1enf+2jIIQPN5RgVegn
 Xov9956xyGBMx4lVwtNGLtQe7sfqH/ghdeMR2f3u3osm1laJOWpnltpnohQc/CBq5KMxxKr9cBS
 wx3gDuYw7rYI4E6EdlS+Eq3vnUpO3q1xusNbQOpuJkA==
X-Received: by 2002:ac8:664b:: with SMTP id j11mr45073499qtp.137.1571232329517; 
 Wed, 16 Oct 2019 06:25:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws9hf52+9048LsczQSDvWaJvNG5OwaogRNh8zQVnjjsy76rxKcYEG/hZBV1K7TOcLOSbkCYmX/s2gKOvqWG+Y=
X-Received: by 2002:ac8:664b:: with SMTP id j11mr45073481qtp.137.1571232329228; 
 Wed, 16 Oct 2019 06:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <b0ab99ed-35a1-7602-518b-e4b9d6e3715e@earthlink.net>
In-Reply-To: <b0ab99ed-35a1-7602-518b-e4b9d6e3715e@earthlink.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 16 Oct 2019 15:25:16 +0200
Message-ID: <CACO55tvw_7LyOV72t-VFUXbZoaDNDX=0qWX1D1W_qWy3WDMSZA@mail.gmail.com>
To: Felix Miata <mrmazda@earthlink.net>
X-MC-Unique: oZbsjFy8OGCOSMxmRq-R7w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571232333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEo2JGGR83z4dvhEbQ16Scz0+IbeC8FyhXp9HZiprhk=;
 b=LAIDRGc8+NH1JI6swmzAijzs5fIJIm2HQcmb+iYHdX4x2WrgUFE5SFjdT+zqRDtmXnecfl
 XCp1VHarTP6ljwGMt6K/LNoTj9QIt1RBm58u55K39QC42DpCH0JhN8Mjxs6o9BVRU4k+Cx
 rnLukV1ejKrXtQ0ray3s6IaKmZq7t/U=
Subject: Re: [Nouveau] nouveau kernel module will not load on old Sony Vaio
 laptop with 8400M GT
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ZG8geW91IGtub3cgaWYgaXQgdXNlZCB0byB3b3JrIHdpdGggb2xkZXIga2VybmVscz8gSWYgeWVz
LCBtYXliZSBhIGdpdApiaXNlY3Qgb24gdGhlIGtlcm5lbCBjb3VsZCBoZWxwCgpPbiBXZWQsIE9j
dCAxNiwgMjAxOSBhdCAxMjo0OCBBTSBGZWxpeCBNaWF0YSA8bXJtYXpkYUBlYXJ0aGxpbmsubmV0
PiB3cm90ZToKPgo+IGlzIHRoZXJlIGFueW9uZSBoZXJlIHdobyBjYW4gaGVscCB3aXRoOgo+Cj4g
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExODUzCj4gbm91
dmVhdSBrZXJuZWwgbW9kdWxlIHdvbid0IGxvYWQgKG5vdCBhdmFpbGFibGUpIG9uIFNvbnkgbGFw
dG9wIHdpdGggTlZJRElBIEc4Nk0KPiBbR2VGb3JjZSA4NDAwTSBHVF0gSUQ6IDEwZGU6MDQyNgo+
Cj4gPz8/Cj4gLS0KPiBFdm9sdXRpb24gYXMgdGF1Z2h0IGluIHB1YmxpYyBzY2hvb2xzIGlzIHJl
bGlnaW9uLCBub3Qgc2NpZW5jZS4KPgo+ICBUZWFtIE9TLzIgKiogUmVnLiBMaW51eCBVc2VyICMy
MTE0MDkgKiogYTExeSByb2NrcyEKPgo+IEZlbGl4IE1pYXRhICAqKiogIGh0dHA6Ly9mbS5uby1p
cC5jb20vCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
