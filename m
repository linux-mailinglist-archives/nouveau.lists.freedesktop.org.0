Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0AF107165
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2019 12:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B976F530;
	Fri, 22 Nov 2019 11:31:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C1C6F530
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2019 11:31:08 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-eIFYhNFrN1KiIXKPVUE7Gw-1; Fri, 22 Nov 2019 06:31:05 -0500
Received: by mail-qt1-f199.google.com with SMTP id h39so4433729qth.13
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2019 03:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aur9rsWegbHLh3oY6ky2CGYiseXs+N84XUMnQYfdl6g=;
 b=Zn4415eCIpQ3xk09cnowvcoAWvUQtKbmcPsz5+fV3Efx9lyHcEFR7cAm2c+Oye2GfI
 LT/LmLUBr6hECz5tLC7BmKQ1/U/0RASL5IoDzoI1s5F081TJ4yo/xH6UV6Z7k6wqPEC4
 NjIj6hcQgmuLQAulTAuHBmbQcZDHh6JaJRLcpSgymwtYQTSWD4dpMv48fVXcdSXaA+Ev
 +SDEWLqgoLJz1rGJqH0KZ4shJjy88zlf0ELQV3JfEMVsexTefoKoM1pGmsi1bsbyHBY+
 zE6xuN8nCu1iqVJUFRqv0jNhoCGOio662TZBZD1/4ybjcac3hVufyKZigc4z+LiaGUa5
 /G0A==
X-Gm-Message-State: APjAAAUT0wIFn4J9lhBDOX+Yn2Sf5wATuGFfkOUXlwZfie3l3aHVXRn6
 ew74MFD63v+pOEaWZby7BUJlHliYrPlsyJJ/jGIgcK07OZ2kZ22WgxeM9kDR69kZzcwLxpQcT/U
 guVNOIlKjyCWiY2kuyX6WqvZ9fDCgjs+u0/fXQe9fXw==
X-Received: by 2002:ac8:5557:: with SMTP id o23mr13894110qtr.378.1574422264297; 
 Fri, 22 Nov 2019 03:31:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4tUnanEcz7OF5qm09oSIPeTrgesqROQcAYMdb3VQX3IrvgvC0XjOQgTAq+ByslNwLSUis/BX58JFkAfiwgdw=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr13894072qtr.378.1574422264060; 
 Fri, 22 Nov 2019 03:31:04 -0800 (PST)
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
 <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
In-Reply-To: <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 22 Nov 2019 12:30:52 +0100
Message-ID: <CACO55tue979AjxXO0MsOMVzUYvVaLh3rMDVg43=kqz=-OpW3Jw@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: eIFYhNFrN1KiIXKPVUE7Gw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574422267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fk7+9wRBOnitbINGrkgws0BRV6i2F3wIBf4jxMH1Ew8=;
 b=EJfnuboNAIU8HJCcllqo39x8QgAWBEUPPRuyljE5Q3uyP3Q0Kbh2S6CaY2u3sVw6WwidsK
 pfQBbHzx28SkQFarKRjAbR+kwr9NAgqSkFYbZTyCi+FlUTK5EYZLqVTQRSl6kehnvtkR0S
 a5MOnQBdnSSeabcPO8DcJIJcMrk5Qbw=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTA6MDcgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDE6MTMgQU0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IHNvIHdoaWxl
IHRyeWluZyB0byB0ZXN0IHdpdGggZDNjb2xkIGRpc2FibGVkLCBJIG5vdGljZWQgdGhhdCBJIHJ1
bgo+ID4gaW50byB0aGUgZXhhY3Qgc2FtZSBlcnJvci4KPgo+IERvZXMgdGhpcyBtZWFuIHRoYXQg
eW91IGRpc2FibGVkIGQzY29sZCBvbiB0aGUgR1BVIHZpYSBzeXNmcyAodGhlCj4gImQzY29sZF9h
bGxvd2VkIiBhdHRyaWJ1dGUgd2FzIDApIGFuZCB0aGUgb3JpZ2luYWwgcHJvYmxlbSBzdGlsbAo+
IG9jY3VycmVkIGluIHRoYXQgY29uZmlndXJhdGlvbj8KPgoKeWVzLiBJbiBteSBwcmV2aW91cyB0
ZXN0aW5nIEkgd2FzIHBva2luZyBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJzIG9mIHRoZQpicmlkZ2Ug
Y29udHJvbGxlciBhbmQgdGhlIEdQVSBkaXJlY3RseSBhbmQgdGhhdCBuZXZlciBjYXVzZWQgYW55
Cmlzc3VlcyBhcyBsb25nIGFzIEkgbGltaXRlZCBpdCB0byBwdXR0aW5nIHRoZSBkZXZpY2VzIGlu
dG8gRDNob3QuCgo+ID4gQW5kIEkgdmVyaWZpZWQgdGhhdCB0aGUKPiA+IFxfU0IuUENJMC5QRUcw
LlBHMDAuX1NUQSByZXR1cm5zIDEsIHdoaWNoIGluZGljYXRlcyBpdCBzaG91bGQgc3RpbGwgYmUK
PiA+IHR1cm5lZCBvbi4KPgo+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhpcyBjb21tZW50
LCBzbyBjYW4geW91IGV4cGxhaW4gaXQgYSBiaXQgdG8KPiBtZSwgcGxlYXNlPwo+Cgp0aGF0J3Mg
dGhlIEFDUEkgbWV0aG9kIHRvIGZldGNoIHRoZSAic3RhdHVzIiBvZiB0aGUgcG93ZXIgcmVzb3Vy
Y2UsIGl0CnNob3VsZCByZXR1cm4gMCB3aGVuIHRoZSBkZXZpY2Ugd2FzIHBvd2VyZWQgb2ZmICh0
aGUgR1BVKSBhbmQgMQpvdGhlcndpc2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
