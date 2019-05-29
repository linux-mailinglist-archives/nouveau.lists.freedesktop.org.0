Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7482DF20
	for <lists+nouveau@lfdr.de>; Wed, 29 May 2019 16:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271A56E0DE;
	Wed, 29 May 2019 14:04:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C856E0DE
 for <nouveau@lists.freedesktop.org>; Wed, 29 May 2019 14:04:24 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id n5so1906093ioc.7
 for <nouveau@lists.freedesktop.org>; Wed, 29 May 2019 07:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdTFtJBR9jKpCGHNG8KFYl+Q+TPFWWgyDCIBjFtz6Ow=;
 b=tICkE67eK1RyiSbwGIFJGYe0XolYyj0XltH1hoAO7XyVYbtfHiVjxue0wTHTdJOs+I
 qXQUN5cMY1Ielr9dMlJPOS3oTIhdypUBGml3n+MESM5pAmNASZLJRfIT196J83+cu7jk
 xO3VKsQ+NFo3rDS2ZGfe5RRlFDuqVrHWagxc6Q9XSs7RJbHq2cGH0EHZMrZEPXMQeaWB
 qOoOGU56XqyCfmhbi05ByNPscQSuOZsQFay1WV98mq8uANbdwgicEO1vQgHY0Kk30Fu5
 XLWrDFysMBm4F8y056dO1YwgLzRvaRvneZuk1aSygRg7ynvnTs4Fug5TmK1Jjq37Rq3D
 LdoQ==
X-Gm-Message-State: APjAAAVamaLCguXIJwa8z0ziyMACMlA14B4Rk4njDbr83ZjQyoFKAWmW
 fE9lTlHGUiBBB+qwP2FUSmowBnoO0FhqE1QQrxzehQ==
X-Google-Smtp-Source: APXvYqw2aAesuEtouGr8qtUi9ZrEMBJCTu/nAu+RGBGNGfdORIqtLxJIOWkwKfu2PYgzQs1IgU2Q/B2W6HUDgIlHQiU=
X-Received: by 2002:a6b:c886:: with SMTP id
 y128mr10155810iof.100.1559138663988; 
 Wed, 29 May 2019 07:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <2b626681-3504-c7e9-10d2-0f906dcb176d@bluegap.ch>
In-Reply-To: <2b626681-3504-c7e9-10d2-0f906dcb176d@bluegap.ch>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 29 May 2019 16:04:12 +0200
Message-ID: <CACO55tsFLc1M0pPe0_2=Dn7j8KctApganDoe=hNBsLCfNLXULw@mail.gmail.com>
To: Markus Wanner <markus@bluegap.ch>
Subject: Re: [Nouveau] Support for GP107(GL)M with Optimus
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

dGhhbmtzIGZvciB5b3VyIG1haW4uCgpJZiB5b3Ugd2FudCB5b3UgY291bGQgdHJ5IG91dCB0aG9z
ZSBwYXRjaGVzIG9uIGEga2VybmVsIGFuZCBzZWUgaWYKdGhvc2UgbWFrZSBhbnkgZGlmZmVyZW5j
ZSBvbiB5b3VyIG1hY2hpbmU6CgpodHRwczovL2dpdGh1Yi5jb20va2Fyb2xoZXJic3QvbGludXgv
Y29tbWl0cy9ydW5wbV9maXhlcwoKbWFrZSBzdXJlIHlvdSB1c2UgdGhlICJydW5wbV9maXhlcyIg
YnJhbmNoLiBXZSBhcmUga2luZCBvZiBhd2FyZSBvZgp0aGUgaXNzdWVzIG9uIG1vZGVybiBsYXB0
b3BzIGFuZCBhbHJlYWR5IHRyeSB0byBmaW5kIGEgcHJvcGVyCnNvbHV0aW9uLCBpdCBtb3N0bHkg
Ym9pbHMgZG93biB0byB0ZXN0aW5nIGFuZCBjaGVja2luZyBpZiB0aGVyZSBhcmUKb3RoZXIgaXNz
dWVzIGxlZnQgd2UgZGlkbid0IGFkZHJlc3MgeWV0LiBBbHNvIHdpdGhvdXQga25vd2luZyB3aGF0
CmVycm9yIG1lc3NhZ2UgeW91IGFyZSBnZXR0aW5nIHByZWNpc2VseSBJIGNhbiBvbmx5IG1ha2Ug
YW4gZWR1Y2F0ZWQKZ3Vlc3Mgb24gd2hhdCB5b3VyIGlzc3VlIG1pZ2h0IGJlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
