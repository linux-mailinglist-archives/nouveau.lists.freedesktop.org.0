Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0A9C57D
	for <lists+nouveau@lfdr.de>; Sun, 25 Aug 2019 20:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C553C6E11E;
	Sun, 25 Aug 2019 18:24:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37ED88E9B
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2019 11:28:41 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id o9so3436657iom.3
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2019 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=YAoBe+zkm2PqTMGvpHeUOkxrZz4GPrXuxGFkrwx8usX+zQNN66FVjXkEEyJCl/emp+
 243CXzfv7EDNaVGyhsBDWO66DbQMr6/RcKFB8Rl1fhhLDap5arE8F6ApEkXXgfejM3Go
 k+33xBMksV4d2aM4DO1Dg49pnuV1cyGRGzAo0tcBrMR10dgZ+1bR++dPlBTp+bpsNkRU
 Pc0m3o4dcHUtegqSw8EvqJ1yylPhKaOqiaXn7NICslzxTIyGkiJ67uKCpHtgk8PFRyC5
 WZIlDkZPcSHAtSTGQlr3xJhnk0nFQmt/mqCBxztm4QHlMxpoI9LDeEQilKmvUvX7q4rf
 MOrQ==
X-Gm-Message-State: APjAAAW7OcCeNZ2obc7XQwzCinNLB+ZgzqozBOOatoKYR9a7tZ7z1SDu
 huR4PGWnGom8afR5nA+ZuYHKxc3a64aBZ/E10bQvVQ==
X-Google-Smtp-Source: APXvYqws9l57+4N1t5CybQVbaJVVd9Nfbb44LfgnzTxj+oSX0EqosHdKwwu2xUgfJeO4/2mhYPOE0MJ85EFvW0XmVeo=
X-Received: by 2002:a02:ca0c:: with SMTP id i12mr25223915jak.82.1566214120815; 
 Mon, 19 Aug 2019 04:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Mon, 19 Aug 2019 13:28:29 +0200
Message-ID: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Sun, 25 Aug 2019 18:24:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=VomSogBR+Rjw/zSHOgYzWP0EPLOWDtlkOX71pe6ugmjomlrnQcTpcjmO8sKNJJVF88
 eBBJwuHQMPRsPnPRI1d3VWz79WvjiSugyn9jqibRlINZRgvgDoPjI2EtLD1fnsLV99c2
 ShCoueTKwSrH6XIpq3jwrrr8LQOc+bXuyUl/de11l4GYIgokqYrOeou3Ki93L+WqlQJx
 GBubyAUF11lufOEIB4UNoLNvXP6xnBfxBWyQ5xpZJrGplgu4FdH8bkcGeEjP/ZaKEtLl
 6ea5JCPDW1r6tJ7EqnwrgEoniW2UAOXZ55UlUK2Muaf/SGJ0KQMtvI49SO35Tby1zv3b
 l6BQ==
Subject: Re: [Nouveau] [PATCH v7 0/9] drm: cec: convert DRM drivers to the
 new notifier API
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Allison Randal <allison@lohutok.net>, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Lim <Thomas.Lim@amd.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6MzggQU0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+CkhpIEhhbnMuCj4gVGhlIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseSBmcm9tIGVhY2gg
b3RoZXIuCj4KPiBJZiB5b3UgbWFpbnRhaW4gb25lIG9mIHRoZXNlIGRyaXZlcnMgYW5kIHlvdSB3
YW50IHRvIG1lcmdlIGl0IGZvciB2NS40Cj4geW91cnNlbGYsIHRoZW4gcGxlYXNlIGRvIHNvIGFu
ZCBsZXQgbWUga25vdy4gSWYgeW91IHByZWZlciBJIGNvbW1pdCBpdAo+IHRvIGRybS1taXNjLCB0
aGVuIHBsZWFzZSByZXZpZXcgYW5kIChob3BlZnVsbHkpIEFjayB0aGUgcGF0Y2guCj4KPiBJIHdv
dWxkIHJlYWxseSBsaWtlIHRvIGdldCB0aGlzIGluIGZvciB2NS40IHNvIEkgY2FuIGdldCB0aGUg
dXNlcnNwYWNlCj4gYml0cyBpbiBmb3IgdjUuNCBhcyB3ZWxsIHRocm91Z2ggdGhlIG1lZGlhIHN1
YnN5c3RlbS4KPgo+IERhcml1c3osIGNhbiB5b3UgcG9zdCBhIHY3LjEgZm9yIHBhdGNoIDUvOSBm
aXhpbmcgdGhlIHR5cG8/Cj4KRG9uZS4KCkkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB0ZXN0
IHY3IGNoYW5nZXMgdG8gZHctaGRtaSBhbmQgdGRhOTk4eCBvbgphIHJlYWwgaGFyZHdhcmUuIEhh
bnMsIGRvIHlvdSB0aGluayB5b3Ugd291bGQgYmUgYWJsZSB0byB0ZXN0IHRob3NlPwoKVGhhbmsg
eW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
