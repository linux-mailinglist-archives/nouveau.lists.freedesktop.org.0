Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0EF6517D
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 07:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559CF8970E;
	Thu, 11 Jul 2019 05:36:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B378970E
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 05:36:37 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id u141so1804239ywe.4
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jul 2019 22:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePwg27Q7oE7ZBh+JC517Tz8x4ebhoe5lFwuorWlrxE0=;
 b=QYMIDZu5eFqi9IotSQnfsHBplaFd6Pk8+uVgcGOOSbGQAv8Zxng3rBim5DxI993AvN
 gRPbyNBe5EJxniScWGLjtQRAvzgEPnbT44iKPSEKKNc2CxeAPP6i/qxw3wB8PYUIkmAL
 630csmgOmUdpZDNwglMPFUN09FxISPHHuVpsykox/b5Dfmf9EE82OckUtDqWqmUisq0+
 IrhyfCmlQh6aTp+CTOXOVu+vPhHTY+iYiI9kodNoP79UYlTz/w5JkO71pCzGJ4to4R81
 RiGaFr68fRV0H9BajsSFF+bDoC0WGtnMK22r96maw4pVAyahg/SY8KO+Bp6riHImVqTs
 g//w==
X-Gm-Message-State: APjAAAVKsNgWvKxN6MUmgbVyrdjOCSw1QLgl5DYQ9qwbfyV/8+CE04y2
 oFI6EylZOVtC8JYbDhuB8HcnEq5mCW5XmS/+YuhPug==
X-Google-Smtp-Source: APXvYqx4oXgd2Pac+M4XQoyC2tT/r1Z8DS3ACr/3x2jveogSOU7qp6grlaWmQH8R8xaM2yGYzE5WG8XMzxHVST0339E=
X-Received: by 2002:aed:3644:: with SMTP id e62mr1364770qtb.80.1562823396672; 
 Wed, 10 Jul 2019 22:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190708051744.24039-1-drake@endlessm.com>
 <20190710224716.GD35486@google.com>
In-Reply-To: <20190710224716.GD35486@google.com>
From: Daniel Drake <drake@endlessm.com>
Date: Thu, 11 Jul 2019 13:36:25 +0800
Message-ID: <CAD8Lp47=5PtYWV3Gu3kH3uTsdFHm4NhOsNPQcy=7or_Og_p7NA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ePwg27Q7oE7ZBh+JC517Tz8x4ebhoe5lFwuorWlrxE0=;
 b=L/LNowbwhm4QGq/ZOr/DekD2HA/dA1iCujHnDWinHiymR2i9YhtW3x3by4zZHTbMsc
 YDIg3IHYtMRV4KiKXKaO6wmQBuEdKjFNujsJfD8f8sUvjPwP3H6J6PwCxC6uBd7+enag
 Yz6oWdgVzcBFGgXAsYNpUOWmZVbPB64r7j8v4aFih/FxDtH01pRl558QzOigM9W46UBs
 OZAMb0zhSslQkhona9gqEx+5OR5o2T7kKvtLV1xObsPJ6PTMqQ7Vf0foUlH5/hOoJqcO
 Q+P7vtn6uf/FeLyFNQsQajcgagsWHA+If0oFh3bhiuy42WzyvvPbUVLVuSmTxj20OIDn
 vsSg==
Subject: Re: [Nouveau] [PATCH v2] PCI: Expose hidden NVIDIA HDA controllers
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
Cc: Aaron Plattner <aplattner@nvidia.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Maik Freudenberg <hhfeuer@gmx.de>,
 nouveau@lists.freedesktop.org, Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgNjo0NyBBTSBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IEkgYXBwbGllZCB0aGlzIChzbGlnaHRseSByZXZpc2VkIGFzIGJl
bG93KSB0byBwY2kvbWlzYyBhbmQgSSB0aGluayB3ZQo+IGNhbiBzdGlsbCBzcXVlZXplIGl0IGlu
IGZvciB2NS4zLgoKVGhhbmtzLiBUZXN0ZWQgYnJpZWZseSBhbmQgaXQgc2VlbXMgdG8gYmUgd29y
a2luZyBmaW5lIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
