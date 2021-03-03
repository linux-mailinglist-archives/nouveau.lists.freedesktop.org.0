Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14D32B953
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 17:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC936E40D;
	Wed,  3 Mar 2021 16:52:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF756E40D
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614790369;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuafV9iaKeRCuCbrDXsJ7dHnd1BZ5WTGR38IgEon89s=;
 b=KMjwe3PdhEqvsvecRb6QQ4frBHiUGpEjkkrXgnKC+VRzCtiTVbncJ78RiTOckbOmRQDuf/
 cKOo6BqrEY+SrjnfP6RvIYzlMnqF123+tWZJ5FhusOg335yUjtUH31ow6OJa9xtyYeinMz
 tpq8YJSSN0S29JptpsFCvrAjJ74IIhA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-w6LUea5-Oj69OCGWGXT8nQ-1; Wed, 03 Mar 2021 11:52:44 -0500
X-MC-Unique: w6LUea5-Oj69OCGWGXT8nQ-1
Received: by mail-qv1-f72.google.com with SMTP id d15so18083762qvn.16
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 08:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vuafV9iaKeRCuCbrDXsJ7dHnd1BZ5WTGR38IgEon89s=;
 b=M/A9ltng6NEjNe1/zeZdzlX2Jqs9afmK9v/MBRlVgm9PVq8vvw1iapOddCQVUbDhQm
 Fzax1cDweW47uGs8UeQqmit2uWb97+K/s0FGKO9H+7Jq6upp5i6tmfiUBHVk4A27jONk
 35EjRKc9O9dJotuGV02718lCxPZiSlyjEp2YZQjiTpQKew2+AySywJ970oZc00H68HRJ
 +DOsXMUeV3TMX+LhvQkKwB0MJT+aWg2UA58HK/ajuvsSrtOSbsodU1+3LBl1sPJR40t9
 PQbbCdFp1/spe2SHsyZellYVq+l5LYspYjN+bf5Vx2y8DlC5oPy/lKQfzr0bpn4gCSjN
 Jf7w==
X-Gm-Message-State: AOAM530fzzpbxfvEPXmXMiwrnYBqIw1EAr2cBCsOepPIN63TVPTdaCzp
 3Tf3eXFMmxuKcbaC31dfxqLAZs/2aae2o3GRkiyS8M74rQ0jPuD++L9GBfHCPUXLrvkdGe74/et
 LV6tUN8069j2PaRnGXid8jqO1/w==
X-Received: by 2002:ac8:7392:: with SMTP id t18mr88278qtp.104.1614790364457;
 Wed, 03 Mar 2021 08:52:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRWwQPHZiKC09PdyNhlbkJTWeTtRw/uphRdlzLLWHMQESdVZfoUpNN0OnE7ymkuHZToRDZ0A==
X-Received: by 2002:ac8:7392:: with SMTP id t18mr88256qtp.104.1614790364277;
 Wed, 03 Mar 2021 08:52:44 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h12sm16962779qko.29.2021.03.03.08.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:52:43 -0800 (PST)
Message-ID: <fb624c779ff09228e8bf4ac31a8bcf9edca658cb.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed, 03 Mar 2021 11:52:42 -0500
In-Reply-To: <20210303134319.3160762-18-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <20210303134319.3160762-18-lee.jones@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 17/53] drm/nouveau/dispnv50/headc57d: Make
 local function 'headc57d_olut' static
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpUaGFua3MhCgpPbiBX
ZWQsIDIwMjEtMDMtMDMgYXQgMTM6NDIgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiBGaXhlcyB0
aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiDCoGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmM6MTczOjE6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzCj4gcHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwg
MiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdk
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiBpbmRl
eCBmZDUxNTI3YjU2YjgzLi5iZGNmZDI0MGQ2MWM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCj4gQEAgLTE2OSw3ICsxNjksNyBAQCBoZWFkYzU3
ZF9vbHV0X2xvYWQoc3RydWN0IGRybV9jb2xvcl9sdXQgKmluLCBpbnQgc2l6ZSwKPiB2b2lkIF9f
aW9tZW0gKm1lbSkKPiDCoMKgwqDCoMKgwqDCoMKgd3JpdGV3KHJlYWR3KG1lbSAtIDQpLCBtZW0g
KyA0KTsKPiDCoH0KPiDCoAo+IC1ib29sCj4gK3N0YXRpYyBib29sCj4gwqBoZWFkYzU3ZF9vbHV0
KHN0cnVjdCBudjUwX2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50
IHNpemUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChzaXplICE9IDAgJiYgc2l6ZSAhPSAy
NTYgJiYgc2l6ZSAhPSAxMDI0KQoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hl
cikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGgg
YSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlv
dSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ug
b24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVh
c2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0
dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQo=
