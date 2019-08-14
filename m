Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF06F90D31
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 07:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED00C6E433;
	Sat, 17 Aug 2019 05:45:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A4689B45
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:49:46 +0000 (UTC)
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <alex.hung@canonical.com>)
 id 1hy19M-0002ln-EG
 for nouveau@lists.freedesktop.org; Wed, 14 Aug 2019 21:49:44 +0000
Received: by mail-qt1-f199.google.com with SMTP id i13so600239qtq.5
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w1D8Zv52DMVI+1tJMrYZUNsEQ+/Ls5xmkyTop5o1js0=;
 b=T57GSZgcy/AW9p4cVbGFMqBlm/0PRUAi3Y3AIsTLmQpYcbI9ihf+veIZ4HYUPGmpbW
 n5LceqLTrMfZ03+WJpoFVZO4mlJOw5suT3dPSYjfEfnZtum2rT3XX/Hi6ocpYoinf4pD
 9RviM4xJFK8KEZ+tp2bE4V2J9+wo5etc9MjWIwkN7NoMjAwTY1s8sDu/pdwgMpH3jCQc
 OfqtANz73C2t+Cppq4k7D4OLU0sJzMdCnZ/QyL4ZlhUejCju26yRJJ3nQlL8QBzy6OKI
 yzsKnIPHyRNdHqjFWDiD/XhDJPLOO8A25J6cZGG2hofujQ/YdIggKwTjfFVpFRkqcccR
 9ACA==
X-Gm-Message-State: APjAAAX3f1rO3WsW1cBMWCfxoED8kuUb/fxcV3atTwvDlLMvnqfcnFBm
 YoIerkRELOCPL5fe0ZYsbVRwcOnbhgKJPShFERrnBylC0gkjtrnJJMkp6PI/JclZKkq6x6TbAaW
 NT+sNyhLJZs2Z69fZU1ySxuoW59+5o1qq0HpKHhP7vAajyG8T71kp5GX8A5U=
X-Received: by 2002:a0c:f706:: with SMTP id w6mr1203590qvn.98.1565819383589;
 Wed, 14 Aug 2019 14:49:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcGzXZYUfIv5JuhgEy8csgt/G/+sxp+oSBTO1E+31KuR6LKUls9RsfxiIM2IRCFHVyk/GRcm+GmCe9i0bILN4=
X-Received: by 2002:a0c:f706:: with SMTP id w6mr1203573qvn.98.1565819383322;
 Wed, 14 Aug 2019 14:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
In-Reply-To: <20190814213118.28473-2-kherbst@redhat.com>
From: Alex Hung <alex.hung@canonical.com>
Date: Wed, 14 Aug 2019 15:49:32 -0600
Message-ID: <CAJ=jquaoA+_WmTJtcGq4b0A_Sb=Aw_3_TsUR-8nxJ+rJTdoFPA@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 05:45:39 +0000
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string
 to enable dGPU direct output"
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
Cc: nouveau@lists.freedesktop.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgc2VyaWVzIG9mIGZpeGVzLiBJIHdpbGwgY2hlY2sgd2hldGhlciB0aGVz
ZSBmaXhlcyB3b3JrCm9uIHRoZSBvcmlnaW5hbCBpbnRlbmRlZCBzeXN0ZW1zLgoKT24gV2VkLCBB
dWcgMTQsIDIwMTkgYXQgMzozMSBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJm
NjhlNGFiYmQ4NzI0MmMuCj4KPiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgZGlkbid0IGV2
ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXyBzdXBwb3J0IGl0IGFuZAo+IGl0IHdvcmtzIHdpdGgg
Tm91dmVhdSBhcyB3ZWxsLgo+Cj4gQWxzbyB3aGF0IHdhcyB0aGUgaXNzdWUgYmVpbmcgc29sdmVk
IGhlcmU/IE5vIHJlZmVyZW5jZXMgdG8gYW55IGJ1Z3MgYW5kIG5vdAo+IGV2ZW4gZXhwbGFpbmlu
ZyBhbnkgaXNzdWUgYXQgYWxsIGlzbid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+Cj4gQW5kIGV2
ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtlIGl0
IHdvcmsgaW5zaWRlIHRoZQo+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91
bmQgdGhyb3VnaCBBQ1BJIHRyaWNrcy4KPgo+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZlcnMg
ZG8gb3IgZG8gbm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUgYml0IGFueXdheS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+IENDOiBBbGV4
IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgo+IENDOiBSYWZhZWwgSi4gV3lzb2NraSA8
cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJl
ZGhhdC5jb20+Cj4gQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ0M6IEJlbiBT
a2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL29zaS5jIHwg
NyAtLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYWNwaS9vc2kuYyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IGluZGV4IGJlYzBi
ZWJjN2Y1Mi4uOWIyMGFjNGQ3OWEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9vc2kuYwo+
ICsrKyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IEBAIC02MSwxMyArNjEsNiBAQCBvc2lfc2V0dXBf
ZW50cmllc1tPU0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2luaXRkYXRhID0gewo+ICAgICAgICAg
ICogYSBCSU9TIHdvcmthcm91bmQuCj4gICAgICAgICAgKi8KPiAgICAgICAgIHsiTGludXgtTGVu
b3ZvLU5WLUhETUktQXVkaW8iLCB0cnVlfSwKPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBMaW51
eC1IUEktSHlicmlkLUdyYXBoaWNzIGlzIHVzZWQgYnkgQklPUyB0byBlbmFibGUgZEdQVSB0bwo+
IC0gICAgICAgICogb3V0cHV0IHZpZGVvIGRpcmVjdGx5IHRvIGV4dGVybmFsIG1vbml0b3JzIG9u
IEhQIEluYy4gbW9iaWxlCj4gLSAgICAgICAgKiB3b3Jrc3RhdGlvbnMgYXMgTnZpZGlhIGFuZCBB
TUQgVkdBIGRyaXZlcnMgcHJvdmlkZSBsaW1pdGVkCj4gLSAgICAgICAgKiBoeWJyaWQgZ3JhcGhp
Y3Mgc3VwcG9ydHMuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIHsiTGludXgtSFBJLUh5YnJpZC1H
cmFwaGljcyIsIHRydWV9LAo+ICB9Owo+Cj4gIHN0YXRpYyB1MzIgYWNwaV9vc2lfaGFuZGxlcihh
Y3BpX3N0cmluZyBpbnRlcmZhY2UsIHUzMiBzdXBwb3J0ZWQpCj4gLS0KPiAyLjIxLjAKPgoKCi0t
IApDaGVlcnMsCkFsZXggSHVuZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
