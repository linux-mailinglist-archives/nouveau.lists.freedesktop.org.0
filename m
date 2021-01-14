Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EB2F66DC
	for <lists+nouveau@lfdr.de>; Thu, 14 Jan 2021 18:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1689A57;
	Thu, 14 Jan 2021 17:09:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F166E1BA
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 10:33:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g25so5229136wmh.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
 b=x8ApzkDMlTt2JG1XTWJhNr1UKtQ6IFke3c3xr3SNGi+9jXp61r4rSclfE/x1ZsbC6E
 kc3JWmQopOjyxq44LwowQmbznGUqSL8wNXevUO002EUou0BIqTw8RYLVCiGE12+CxOX/
 fxzIAzI7B2R4ewJDEktxUkcQ9SXPjACGgvZ9SFyT7k+98Hh+k6Ffwn0+1CFwBNjXgJeC
 HZ9wtKBjT9978oC3ER0xABCm+aUUHni1g67qqK7MQvH1V6NJJE0oBi422TUbvcXF/XDo
 OhKFaCHNP4yp/yeXwV/H58LDpQdqoatqp/ojdlHvfoNnH0n1NERfvwFqNzaDrli1Oe+I
 VJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
 b=bg2aDWVOlc5o6ujLDAT9Cs7/lkHRhxGM7n4Yy23DzWTo+QSQesNo9LqhpH5lbME+SA
 3Pq4k55j2jOeWCZDRc6givEdKOBd+nysj6bYdFqP9GMPTOLzW4SDbDLgxyhaI7x4L0TZ
 xhaquMqPUYN4OLQ055SPwYei9TVw4/pmdEaKAkdqiQMF6/1d4IjMR9xdZsi7WTTfktSq
 FqNIQN/kOCCSJS7+sak2sclbuesTtoFw2SEmSYIDvsQ47JGLTg6wobrM9INVo7h5vZYU
 9Fr/cPptrTubxo2/iGnAVmUhYp44B2Nk1okVH+WLH1dOrlHhGjUZ1eNpBaWd76Pi5hEH
 4glA==
X-Gm-Message-State: AOAM531XeVI6J518ZejUeS/LPSoy+RYa0/Pw7Qv+XW1yvsOPeJyXiZDV
 QMdLl/j3oJwVlUeYhhfknoDr9w==
X-Google-Smtp-Source: ABdhPJxOYTenjJAea68Lbo43i7Qv6whisJfp5qKHWu1LHfCUfeuuNEisJHD+dQOSAgNSMN4zAvV+tQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr3262314wmj.52.1610620433288;
 Thu, 14 Jan 2021 02:33:53 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id m17sm9413232wrn.0.2021.01.14.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 02:33:52 -0800 (PST)
Date: Thu, 14 Jan 2021 10:33:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Noah Abradjian <noah.abradjian@amd.com>, nouveau@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <20210114103350.GT3975472@dell>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
X-Mailman-Approved-At: Thu, 14 Jan 2021 17:09:58 +0000
Subject: Re: [Nouveau] [PATCH 00/30] [Set 13] Finally rid W=1 warnings from
 GPU
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBKYW4gMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiAwIG91dCBvZiA1MDAwIGxlZnQhCj4gCj4gTEFT
VCBTRVQhICBZb3UncmUgYWxsIGNsZWFuLiAgQ2FuIHlvdSBiZWxpZXZlIGl0IT8KCkFoLCBmYWly
IHdhcm5pbmcgZm9yIHlvdTogd2UncmUgbm90IHlldCBkb25lLgoKQXJtIGlzIGNsZWFuLiAgVGhl
cmUgYXJlIHN0aWxsIGZpeC11cHMgcmVxdWlyZWQgZm9yIHg4NiBhbmQgUFBDLgoKSSdsbCBnZXQg
cmlnaHQgb24gaXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
