Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0C16FA81
	for <lists+nouveau@lfdr.de>; Wed, 26 Feb 2020 10:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08A26E2CC;
	Wed, 26 Feb 2020 09:18:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1316E229
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2020 21:52:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q8so562417ljj.11
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2020 13:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A2ys7Ib2/Xnmb6RfJjBVglHxRB3L0ppD5nek4nNUG54=;
 b=dggYPJl/S1l5xcOIfxIS/BtjTf2Yhm1QVvH0GMrusu3UZdTJ+2IVNtl7if5lr+GING
 XpTndQesM1wBpqwKNuobZBIXrCPwzFtaklN3vLh2Qnd0+FWtpS3ZfwdtKmGftCZkxItM
 pt0dP1pU0t9V2smNwYJsoeHg/Qbpco6HesYKBw8Pilr2pVi84p88M5YAUcqk8Zh5lIHD
 CSe5MrLa4qFV3znicGDhh7dez3zSSB2e+gT6zhNI5c95nKfh15KuMLKm2jZQougUJ8qj
 kiKUiHXiaPkAZpyYO/fu8wpfUCAfkkn3icXFTgbLvWoWqO41x1j9KZ28pWh6LPjraRTR
 t6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A2ys7Ib2/Xnmb6RfJjBVglHxRB3L0ppD5nek4nNUG54=;
 b=bo1ZHJ6hTjhJQhJSr1OoprUw5vk3HQnDU+sc/UYOOGu6D9+RzbhBCpnXjnux1NJAhR
 F+6srHpzcpjOjvYCA8BAAV50Y04u76h9olg9MajrLbGVMCIqgsxng4L7mLIYFiq8faJq
 M+rl8P3oD46gqz9hoel1n8Uekpf0Qp2q6JpBlJVb6nCUgOECzJrrVjVtk7wAeij49vyQ
 /YOC+V9AGRc8cqV71ZvxWCIN3Ip2hP3ydt04klm5HANwMoyUqMJDf9C0ueeM9ijbutRr
 ga5f0IceVus9rSuGtj/SEbmmZkwBdw3ESTnD/QtKRYs22Ow6BeI4flURYiVbiKyx5kPc
 dJ5A==
X-Gm-Message-State: APjAAAUsawdquZF70yQGSo9KEgKwhynY++G9GzegB78v2Wa45ulBEOb4
 z8ZcFKBFjwBRXpaNP8r7avINB2BkPYC/W5NmHtLKSw==
X-Google-Smtp-Source: APXvYqxOOzmfnyf+WeuQucvX5m9qM2Leiiv6kMjRVdA/nrsazbB0Q+l2xDGTGCvseEFr/CMgRzfQtQJ4YToGbq+Lxpk=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr663831ljc.39.1582667557689;
 Tue, 25 Feb 2020 13:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
 <20200225112114.GA13686@intel.com>
 <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
 <20200225154506.GF13686@intel.com> <20200225192720.GG13686@intel.com>
In-Reply-To: <20200225192720.GG13686@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2020 22:52:25 +0100
Message-ID: <CACRpkdZk9QEy+Kzkmy4BXiHB+aq9hprf=dmA_-R23yqH3NCt1g@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 09:18:53 +0000
Subject: Re: [Nouveau] [PATCH 04/12] drm: Nuke mode->vrefresh
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Eric Anholt <eric@anholt.net>,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Gustaf_Lindstr=C3=B6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Randy Li <ayaka@soulik.info>,
 Maxime Ripard <mripard@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgODoyNyBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT0ssIHNvIEkgd2VudCBhaGVhZCBhIHdy
b3RlIGEgYml0IG9mIGNvY2NpIFsxXSB0byBmaW5kIHRoZSBiYWQgYXBwbGVzLgoKVGhhdCdzIGlt
cHJlc3NpdmUgOkQKCj4gVW5mb3J0dW5hdGVseSBpdCBmb3VuZCBhIGxvdCBvZiBzdHJhbmdlIHN0
dWZmOgoKSSB3aWxsIGFuc3dlciBmb3IgdGhlIHdlaXJkbmVzcyBJIGNhdXNlZC4KCkkgaGF2ZSBs
b25nIHN1c3BlY3RlZCB0aGF0IGEgd2hvbGUgYnVuY2ggb2YgdGhlICJzaW1wbGUiIGRpc3BsYXlz
CmFyZSBub3Qgc2ltcGxlIGJ1dCBjb250YWlucyBhIGRpc3BsYXkgY29udHJvbGxlciBhbmQgbWVt
b3J5LgpUaGF0IG1lYW5zIHRoYXQgdGhlIHNwZWVkIG92ZXIgdGhlIGxpbmsgdG8gdGhlIGRpc3Bs
YXkgYW5kCmFjdHVhbCByZWZyZXNoIHJhdGUgb24gdGhlIGFjdHVhbCBkaXNwbGF5IGlzIGFzeW1t
ZXRyaWMgYmVjYXVzZQp3ZWxsIHdlIGFyZSBqdXN0IHVwZGF0aW5nIGEgUkFNLCB0aGUgcmVzb2x1
dGlvbiBqdXN0IGxpbWl0cyBob3cKbXVjaCBkYXRhIHdlIGFyZSBzZW5kaW5nLCB0aGUgY2xvY2sg
bGltaXRzIHRoZSBzcGVlZCBvbiB0aGUKYnVzIG92ZXIgdG8gdGhlIFJBTSBvbiB0aGUgb3RoZXIg
c2lkZS4KCkluIG1vc3QgY2FzZXMgSSB0aGluZyB0aGUgY2xvY2sgaXMgdGhlIHdheSB0byBnby4K
Cj4gcGFuZWwtc29ueS1hY3g0MjRha3AuYzo1MS9zb255X2FjeDQyNGFrcF92aWRfbW9kZTogNjAg
dnMuIDcyNyAoLmNsb2NrPTMzMDAwMCAuaHRvdGFsPTQ4MCArIDE1ICsgMCArIDE1IC52dG90YWw9
ODY0ICsgMTQgKyAxICsgMTEpCgpJIHN1c3BlY3QgY2xvY2sgc2hvdWxkIGJlIGFkanVzdGVkIGFm
dGVyIHZmcmVzaCA9IDYwIGhlcmUgaW5zdGVhZCBvZiB0aGUKb3RoZXIgd2F5IGFyb3VuZC4gSSBj
b3VsZG4ndCBxdWl0ZSB0ZXN0IHRoZSB2aWRlbyBtb2RlLCBidXQgdGhlIHZlbmRvcgpkcml2ZXIg
KG5vIGRvY3VtZW50YXRpb24gLi4uLikgZG9lcyBzdGF0ZSAzMzAgTUh6IHdoaWNoIHNlZW1zIGEK
Yml0IGhpZ2guCgpKdXN0IGRyb3AgdnJlZnJlc2ggZm9yIG5vdy4KCj4gcGFuZWwtc29ueS1hY3g0
MjRha3AuYzo3MS9zb255X2FjeDQyNGFrcF9jbWRfbW9kZTogNjAgdnMuIDcxMSAoLmNsb2NrPTQy
MDE2MCAuaHRvdGFsPTQ4MCArIDE1NCArIDE2ICsgMzIgLnZ0b3RhbD04NjQgKyAxICsgMSArIDEp
CgpZb3UgY2FuIG92ZXJyaWRlIHRoaXMgaWdub3JpbmcgdGhlIHZyZWZyZXNoLCB0aGlzIGlzIGEg
Y29tbWFuZC1tb2RlCm9ubHksIGFuZCBpbiBjb21tYW5kIG1vZGUgdGhlIHJlZnJlc2ggZG9lc24n
dCBjb21lIGludG8gcGxheSwgb3IgaXMKdmVyeSBoaWdoIGFuZCBsaW1pdGVkIGJ5IGEgYnVuY2gg
b2Ygb3RoZXIgb3ZlcmhlYWQgdGhhbiBqdXN0IHRoZQpyZXNvbHV0aW9uLiBUaGUgY29tbWFuZCBt
b2RlIEhTIGNsb2NrIGlzIEA0MjArIE1IeiBpbmRlZWQuClRlc3RzIHNob3dlZCBhcm91bmQgMTE2
IEh6IGZvciB0aGlzIHBhcnRpY3VsYXIgZGlzcGxheSBpbiBwcmFjdGljZQp3aXRoIGNvbnRpbnVv
dXMgdXBkYXRlcy4KCj4gcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzo1NDMvc3JnYl8zMjB4MjQwX21v
ZGU6IDYwIHZzLiAxMDE2OCAoLmNsb2NrPTI0NTM1MDAgLmh0b3RhbD0zMjAgKyAzNTkgKyAxICsg
MjQxIC52dG90YWw9MjYyKQo+IHBhbmVsLWlsaXRlay1pbGk5MzIyLmM6NTg3L3l1dl82NDB4MzIw
X21vZGU6IDYwIHZzLiA3NzY4ICguY2xvY2s9MjQ1NDAwMCAuaHRvdGFsPTY0MCArIDI1MiArIDEg
KyAyOCAudnRvdGFsPTMyMCArIDQgKyAxICsgMTgpCj4gcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzo2
MTYvaXR1X3JfYnRfNjU2XzY0MF9tb2RlOiA2MCB2cy4gNTM1OCAoLmNsb2NrPTI0NTQwMDAgLmh0
b3RhbD02NDAgKyAzICsgMSArIDI3MiAudnRvdGFsPTUwMCkKPiBwYW5lbC1pbGl0ZWstaWxpOTMy
Mi5jOjU1Ny9zcmdiXzM2MHgyNDBfbW9kZTogNjAgdnMuIDE2MTc4ICguY2xvY2s9MjcwMDAwMCAu
aHRvdGFsPTM2MCArIDM1ICsgMSArIDI0MSAudnRvdGFsPTI2MikKPiBwYW5lbC1pbGl0ZWstaWxp
OTMyMi5jOjYwMS95dXZfNzIweDM2MF9tb2RlOiA2MCB2cy4gNzA3MSAoLmNsb2NrPTI3MDAwMDAg
Lmh0b3RhbD03MjAgKyAyNTIgKyAxICsgMjQgLnZ0b3RhbD0zNjAgKyA0ICsgMSArIDE4KQo+IHBh
bmVsLWlsaXRlay1pbGk5MzIyLmM6NjMxL2l0dV9yX2J0XzY1Nl83MjBfbW9kZTogNjAgdnMuIDU0
MjIgKC5jbG9jaz0yNzAwMDAwIC5odG90YWw9NzIwICsgMyArIDEgKyAyNzIgLnZ0b3RhbD01MDAp
Cj4gcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzo1NzIvcHJnYl8zMjB4MjQwX21vZGU6IDYwIHZzLiA1
OTcyNSAoLmNsb2NrPTY0MDAwMDAgLmh0b3RhbD0zMjAgKyAzOCArIDEgKyA1MCAudnRvdGFsPTI2
MikKClRoaXMgaXMgdGhlIGRhdGFzaGVldCBpZiB5b3Ugd2FudCB0byB0YWtlIGEgbG9vazoKaHR0
cHM6Ly9kZmx1bmQuc2UvfnRyaWFkL2tyYWQvZGxpbmstZGlyLTY4NS9JTEk5MzIyRFNfVjEuMTIu
cGRmCgpUaGUgb25lIHBsYXRmb3JtIHVzaW5nIHRoaXMgaXMgdXNpbmcgdGhlCjggYml0IElUVS1S
IEJULjY1NiA2NDBZIDMyMENiQ3IgbW9kZSB3aGljaAooSSB0aGluaykgaXMgc2ltaWxhciB0byBE
U0kgY29tbWFuZCBtb2RlIGFnYWluOiB0aGVyZSBpcyBhIHN0cmVhbQpvZiBkYXRhIGluIGEgYnVy
c3QgYW5kIHlvdSBkZWNpZGUgaG93IG9mdGVuIHlvdSB3YW50IHRvIHNlbmQgaXQKYmVjYXVzZSB0
aGUgcGFuZWwgYWx3YXlzIGhhcyBiYWNraW5nIG1lbW9yeSBhbmQgdGhlCnNwZWVkIG91dCB0byB0
aGUgcGh5c2ljYWwgZGlzcGxheSBpcyBzb21ldGhpbmcgY29tcGxldGVseQpkaWZmZXJlbnQuCgpZ
b3UgY2FuIHNhZmVseSBkZWxldGUgdnJlZnJlc2ggZnJvbSBhbGwgb2YgdGhlc2Ugc2l0ZXMuCgo+
IHBhbmVsLWFybS12ZXJzYXRpbGUuYzoxNjEvdmVyc2F0aWxlX3BhbmVsc1tdOiA2MCB2cy4gNjEg
KC5jbG9jaz0yNTAwMCAuaHRvdGFsPTY0MCArIDI0ICsgOTYgKyAyNCAudnRvdGFsPTQ4MCArIDEx
ICsgMiArIDMyKQo+IHBhbmVsLWFybS12ZXJzYXRpbGUuYzoyMDgvdmVyc2F0aWxlX3BhbmVsc1td
OiAxMTYgdnMuIDU5ICguY2xvY2s9NTQwMCAuaHRvdGFsPTI0MCArIDEwICsgMTAgKyAyMCAudnRv
dGFsPTMyMCArIDIgKyAyICsgMikKPiBwYW5lbC1hcm0tdmVyc2F0aWxlLmM6MTg0L3ZlcnNhdGls
ZV9wYW5lbHNbXTogMzkwIHZzLiAxNTIzICguY2xvY2s9NjI1MDAgLmh0b3RhbD0xNzYgKyAyICsg
MyArIDMgLnZ0b3RhbD0yMjAgKyAwICsgMiArIDEpCgpUaGUgb25seSBkcml2ZXIgIGRyaXZlcnMv
Z3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMKVXNlcyBtb2RlLT5jbG9jayBzbyBqdXN0IGRy
b3AgdnJlZnJlc2guCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
