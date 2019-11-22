Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F610689B
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2019 10:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FFB6F500;
	Fri, 22 Nov 2019 09:07:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA816F4F0;
 Fri, 22 Nov 2019 09:07:17 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 94so5551037oty.8;
 Fri, 22 Nov 2019 01:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40cp6sbp1LXK6FgVw9DtfWmsQFXcIol/9unXXqPvBWE=;
 b=iyTfFB2vXiobHyOZcK/WEbwp2nI7JOL6kn+++FHTdXEfoITyLyov9lfpB2ddQUlcL5
 6fHlYiBT7sa1OqPH+PCMKjYbI5mlhqIrdvSBdC5VCDn1JT/7DO1AVFiBGMGz6WpQiAxl
 82V+ZyEukHyTZqp7Ik1rLv99mKm2CkDuYBtJG8Xh6gtBrffynmzIzUUGbbOt2QF8DNJ7
 M95p/pWay9n4cqWJW2vhdO+0UgNGCMpyMBth2wwbHhDTX7SJ8vWKDhQHriNofMCwIRRM
 106b/YEbl18AVLmQTRKYwchTl5NcJu4XB5VAstFjS6VSPA1PQUuHH3O09vS0OB6fKoMS
 aQXQ==
X-Gm-Message-State: APjAAAWVlM6s7/nJzt6Fnnnb9yZyoa8g5e9ZqD1ZiamxeOqrGHzJhlRD
 yfP7r+D3yT1QrQl2FxeajyCJUE8yYM7ujagNK4s=
X-Google-Smtp-Source: APXvYqzd0eIxmN800CobU7Ca6/eY+fxOdyQYM0rOLFzFsNXb7tETIPDcTZ5muyZROiFWKVaDqLPhAwIk5Kw3TbBmlQw=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr9451324otn.167.1574413636386; 
 Fri, 22 Nov 2019 01:07:16 -0800 (PST)
MIME-Version: 1.0
References: <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com>
 <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <CACO55tvFeTFo3gGdL02gnWMMk+AHPPb=hntkre0ZcA6WvKcV1A@mail.gmail.com>
 <CACO55tvkQyYYnCs71_nJuNFm4f8kkvBqje8WeZGph7X+2zO3aA@mail.gmail.com>
In-Reply-To: <CACO55tvkQyYYnCs71_nJuNFm4f8kkvBqje8WeZGph7X+2zO3aA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Nov 2019 10:07:04 +0100
Message-ID: <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMToxMyBBTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBzbyB3aGlsZSB0cnlpbmcgdG8gdGVzdCB3aXRoIGQzY29sZCBk
aXNhYmxlZCwgSSBub3RpY2VkIHRoYXQgSSBydW4KPiBpbnRvIHRoZSBleGFjdCBzYW1lIGVycm9y
LgoKRG9lcyB0aGlzIG1lYW4gdGhhdCB5b3UgZGlzYWJsZWQgZDNjb2xkIG9uIHRoZSBHUFUgdmlh
IHN5c2ZzICh0aGUKImQzY29sZF9hbGxvd2VkIiBhdHRyaWJ1dGUgd2FzIDApIGFuZCB0aGUgb3Jp
Z2luYWwgcHJvYmxlbSBzdGlsbApvY2N1cnJlZCBpbiB0aGF0IGNvbmZpZ3VyYXRpb24/Cgo+IEFu
ZCBJIHZlcmlmaWVkIHRoYXQgdGhlCj4gXF9TQi5QQ0kwLlBFRzAuUEcwMC5fU1RBIHJldHVybnMg
MSwgd2hpY2ggaW5kaWNhdGVzIGl0IHNob3VsZCBzdGlsbCBiZQo+IHR1cm5lZCBvbi4KCkkgZG9u
J3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhpcyBjb21tZW50LCBzbyBjYW4geW91IGV4cGxhaW4gaXQg
YSBiaXQgdG8KbWUsIHBsZWFzZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
