Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B75105CDD
	for <lists+nouveau@lfdr.de>; Thu, 21 Nov 2019 23:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD886F4C7;
	Thu, 21 Nov 2019 22:50:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4990B6F4C5
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 22:50:43 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-vov6I0MXPtCvUgJaQlWLIQ-1; Thu, 21 Nov 2019 17:50:40 -0500
Received: by mail-qv1-f69.google.com with SMTP id y24so3400296qvh.1
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 14:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6kwu2ljuFRHJGSHsZ074oAeIVPpmWLJ+DvKmAed55k=;
 b=gjhn+/dlotIfOtg6iTdYzy+ZtoaviqeXBIjTYzLFcfxaMKasV/OOqi1AbBN+mczYx5
 +QsuNch0E2qogzTQUPVE8DQvBOKi9qxVKaPKsvNpIZwIficlf+eJEs2sQBv+yd7pGkHX
 7j6IBM9owi7ssBq9Ae4OJu0fS03Xj5pRai6KdXba7KEU9hQ3mreZcaEaAFWh48FyFcyG
 XAQEywgi/JctEoFX/kQcoLAzaZjKOAewIx8TcHVUTQjH6gfmlt0OOnW9VQRWqsScKeud
 9yXrCy/DRx4a00uxUn275xT5yelT8E0Yg31DbiW2Wgqngec5M/w5fkeiIn8wNhHzNBM/
 LQWg==
X-Gm-Message-State: APjAAAXuHKaY48o67U83Naarhdm8JpllDwSzlREmvoR+jNc+0yNa0oZb
 Ov6CYhkYM5GiNGjf7oKvhHYOF+5JcBrMr9gv/6TRB4wc7KDtXXkYw/y6Jhv0HsIEiQGsJSIMAmo
 arXQgRf+Q5sBg/8m30hmHGyGVvZmeiLmuJlkqLdvKcA==
X-Received: by 2002:a37:8285:: with SMTP id e127mr2677726qkd.62.1574376639813; 
 Thu, 21 Nov 2019 14:50:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqziB5Ucb8ZFpCpITvN4kvLRDkloqv4Emub8IRaRDSPVC7EbFpNg+VGTx80DbnaXEZuqQUj9nX/wiwQNyS7b2t8=
X-Received: by 2002:a37:8285:: with SMTP id e127mr2677652qkd.62.1574376638429; 
 Thu, 21 Nov 2019 14:50:38 -0800 (PST)
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
In-Reply-To: <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Nov 2019 23:50:26 +0100
Message-ID: <CACO55tvFeTFo3gGdL02gnWMMk+AHPPb=hntkre0ZcA6WvKcV1A@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: vov6I0MXPtCvUgJaQlWLIQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574376642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTk6XMOiYbuw5+XVlipRiSh5UzNmwzHGNqkkTsALVdg=;
 b=UnbOIJS4bGF1pGLa/PeSaSlC3cw6VP+ch/v2kfa0DENHVHcW0Hc9DRQa5TqQgL1hZJYPtF
 H0rR+1oXIFtBInJbmbzrrECg4f5CO47ha6f743E22x3+McCZO6wrAPY4/12CTyyH0cxiT1
 GQvffRFXpZhgO/utyY2mdQsFVXq85i0=
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MzkgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDg6NDkgUE0g
TWlrYSBXZXN0ZXJiZXJnCj4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDA0OjQzOjI0UE0gKzAxMDAsIFJhZmFlbCBKLiBX
eXNvY2tpIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxOjUyIFBNIE1pa2Eg
V2VzdGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwMTo0NjoxNFBNICswMjAwLCBNaWth
IFdlc3RlcmJlcmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMjoz
NDoyMlBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1
LCBOb3YgMjEsIDIwMTkgYXQgMTI6MjggUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4gPiA+IDxt
aWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDExOjI5OjMzUE0gKzAxMDAsIFJhZmFlbCBKLiBX
eXNvY2tpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBsYXN0IHdlZWsgb3Igc28gSSBmb3VuZCBz
eXN0ZW1zIHdoZXJlIHRoZSBHUFUgd2FzIHVuZGVyIHRoZSAiUENJCj4gPiA+ID4gPiA+ID4gPiA+
IEV4cHJlc3MgUm9vdCBQb3J0IiAobmFtZSBmcm9tIGxzcGNpKSBhbmQgb24gdGhvc2Ugc3lzdGVt
cyBhbGwgb2YgdGhhdAo+ID4gPiA+ID4gPiA+ID4gPiBzZWVtcyB0byB3b3JrLiBTbyBJIGFtIHdv
bmRlcmluZyBpZiBpdCdzIGluZGVlZCBqdXN0IHRoZSAweDE5MDEgb25lLAo+ID4gPiA+ID4gPiA+
ID4gPiB3aGljaCBhbHNvIGV4cGxhaW5zIE1pa2FzIGNhc2UgdGhhdCBUaHVuZGVyYm9sdCBzdHVm
ZiB3b3JrcyBhcyBkZXZpY2VzCj4gPiA+ID4gPiA+ID4gPiA+IG5ldmVyIGdldCBwb3B1bGF0ZWQg
dW5kZXIgdGhpcyBwYXJ0aWN1bGFyIGJyaWRnZSBjb250cm9sbGVyLCBidXQgdW5kZXIKPiA+ID4g
PiA+ID4gPiA+ID4gdGhvc2UgIlJvb3QgUG9ydCJzCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gSXQgYWx3YXlzIGlzIGEgUENJZSBwb3J0LCBidXQgaXRzIGxvY2F0aW9uIHdpdGhpbiB0
aGUgU29DIG1heSBtYXR0ZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBFeGFjdGx5LiBJ
bnRlbCBoYXJkd2FyZSBoYXMgUENJZSBwb3J0cyBvbiBDUFUgc2lkZSAodGhlc2UgYXJlIGNhbGxl
ZAo+ID4gPiA+ID4gPiA+IFBFRywgUENJIEV4cHJlc3MgR3JhcGhpY3MsIHBvcnRzKSwgYW5kIHRo
ZSBQQ0ggc2lkZS4gSSB0aGluayB0aGUgSVAgaXMKPiA+ID4gPiA+ID4gPiBzdGlsbCB0aGUgc2Ft
ZS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gQWxzbyBzb21lIGN1c3RvbSBBTUwtYmFz
ZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQgdGhhdCBtYXkKPiA+ID4gPiA+ID4g
PiA+IGJlIG1ha2luZyBzcGVjaWZpYyBhc3N1bXB0aW9ucyBvbiB0aGUgY29uZmlndXJhdGlvbiBv
ZiB0aGUgU29DIGFuZCB0aGUKPiA+ID4gPiA+ID4gPiA+IEdQVSBhdCB0aGUgdGltZSBvZiBpdHMg
aW52b2NhdGlvbiB3aGljaCB1bmZvcnR1bmF0ZWx5IGFyZSBub3Qga25vd24gdG8KPiA+ID4gPiA+
ID4gPiA+IHVzLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIGl0IGxv
b2tzIGxpa2UgdGhlIEFNTCBpbnZva2VkIHRvIHBvd2VyIGRvd24gdGhlIEdQVSBmcm9tCj4gPiA+
ID4gPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJfc3RhdGUoKSBnZXRzIGNvbmZ1c2VkIGlmIGl0
IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiA+ID4gPiA+IHRoYXQgcG9pbnQsIHNvIGl0IGxv
b2tzIGxpa2UgdGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNzIGRldmljZSBtZW1vcnkgb24KPiA+ID4g
PiA+ID4gPiA+IHRoZSBHUFUgKGJleW9uZCB0aGUgUENJIGNvbmZpZyBzcGFjZSkgb3Igc2ltaWxh
ciB3aGljaCBpcyBub3QKPiA+ID4gPiA+ID4gPiA+IGFjY2Vzc2libGUgaW4gUENJIHBvd2VyIHN0
YXRlcyBiZWxvdyBEMC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9yIHRoZSBQQ0kgY29u
ZmlnIHNwYWNlIG9mIHRoZSBHUFUgd2hlbiB0aGUgcGFyZW50IHJvb3QgcG9ydCBpcyBpbiBEM2hv
dAo+ID4gPiA+ID4gPiA+IChhcyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBH
UFUgY29uZmlnIHNwYWNlIGlzIG5vdAo+ID4gPiA+ID4gPiA+IGFjY2Vzc2libGUuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3QgYXQg
dGhhdCBwb2ludD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+ID4gPiA+ID4gYSBzdXNwZW5kIG9yZGVy
aW5nIHZpb2xhdGlvbj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50
byBEM2hvdCBmaXJzdCwKPiA+ID4KPiA+ID4gT0sKPiA+ID4KPiA+ID4gRG9lcyB0aGlzIGludm9s
dmUgYW55IEFNTCwgbGlrZSBhIF9QUzMgdW5kZXIgdGhlIEdQVSBvYmplY3Q/Cj4gPgo+ID4gSSBk
b24ndCBzZWUgX1BTMyAobm9yIF9QUzApIGZvciB0aGF0IG9iamVjdC4gSWYgSSByZWFkIGl0IHJp
Z2h0IHRoZSBHUFUKPiA+IGl0c2VsZiBpcyBub3QgZGVzY3JpYmVkIGluIEFDUEkgdGFibGVzIGF0
IGFsbC4KPgo+IE9LCj4KPiA+ID4gPiA+IHRoZW4gdGhlIHJvb3QgcG9ydCBhbmQgdGhlbiB0dXJu
Cj4gPiA+ID4gPiBvZmYgdGhlIHBvd2VyIHJlc291cmNlICh3aGljaCBpcyBhdHRhY2hlZCB0byB0
aGUgcm9vdCBwb3J0KSByZXN1bHRpbmcKPiA+ID4gPiA+IHRoZSB0b3BvbG9neSBlbnRlcmluZyBE
M2NvbGQuCj4gPiA+ID4KPiA+ID4gPiBJIGRvbid0IHNlZSB0aGF0IGhhcHBlbmluZyBpbiB0aGUg
QU1MIHRob3VnaC4KPiA+ID4KPiA+ID4gV2hpY2ggQU1MIGRvIHlvdSBtZWFuLCBzcGVjaWZpY2Fs
bHk/ICBUaGUgX09GRiBtZXRob2QgZm9yIHRoZSByb290Cj4gPiA+IHBvcnQncyBfUFIzIHBvd2Vy
IHJlc291cmNlIG9yIHNvbWV0aGluZyBlbHNlPwo+ID4KPiA+IFRoZSByb290IHBvcnQncyBfT0ZG
IG1ldGhvZCBmb3IgdGhlIHBvd2VyIHJlc291cmNlIHJldHVybmVkIGJ5IGl0cyBfUFIzLgo+Cj4g
T0ssIHNvIHdpdGhvdXQgdGhlICRzdWJqZWN0IHBhdGNoIHdlICgxKSBwcm9ncmFtIHRoZSBkb3du
c3RyZWFtCj4gY29tcG9uZW50IChHUFUpIGludG8gRDNob3QsIHRoZW4gd2UgKDIpIHByb2dyYW0g
dGhlIHBvcnQgaG9sZGluZyBpdAo+IGludG8gRDNob3QgYW5kIHRoZW4gd2UgKDMpIGxldCB0aGUg
QU1MIChfT0ZGIGZvciB0aGUgcG93ZXIgcmVzb3VyY2UKPiBsaXN0ZWQgYnkgX1BSMyB1bmRlciB0
aGUgcG9ydCBvYmplY3QpIHJ1bi4KPgo+IFNvbWV0aGluZyBzdHJhbmdlIGhhcHBlbnMgYXQgdGhp
cyBwb2ludCAoYW5kIEkgZ3Vlc3MgdGhhdCBfT0ZGIGRvZXNuJ3QKPiBldmVuIHJlYWNoIHRoZSBw
b2ludCB3aGVyZSBpdCByZW1vdmVzIHBvd2VyIGZyb20gdGhlIHBvcnQgd2hpY2ggaXMgd2h5Cj4g
d2Ugc2VlIGEgbG9jay11cCkuCj4KCml0IGRvZXMgdGhvdWdoLiBJIHdpbGwgcG9zdCB0aGUgZGF0
YSBzaG9ydGx5ICh3aXRoIHRoZSBjaGFuZ2UgaW4gcG93ZXIKY29uc3VtcHRpb24pLCBhcyBJIGFs
c28gd2FudCB0byBkbyB0aGUgQUNQSSB0cmFjZXMgbm93LgoKPiBXZSBrbm93IHRoYXQgc2tpcHBp
bmcgKDEpIG1ha2VzIHRoaW5ncyB3b3JrIGFuZCB3ZSBraW5kIG9mIHN1c3BlY3QKPiB0aGF0IHNr
aXBwaW5nICgzKSB3b3VsZCBtYWtlIHRoaW5ncyB3b3JrIGVpdGhlciwgYnV0IHdoYXQgYWJvdXQg
ZG9pbmcKPiAoMSkgYW5kICgzKSB3aXRob3V0ICgyKT8KPgo+ID4gPiA+IEJhc2ljYWxseSB0aGUg
ZGlmZmVyZW5jZSBpcyB0aGF0IHdoZW4gV2luZG93cyA3IG9yIExpbnV4ICh0aGUgX1JFVj09NQo+
ID4gPiA+IGNoZWNrKSB0aGVuIHdlIGRpcmVjdGx5IGRvIGxpbmsgZGlzYWJsZSB3aGVyZWFzIGlu
IFdpbmRvd3MgOCsgd2UgaW52b2tlCj4gPiA+ID4gTEtEUygpIG1ldGhvZCB0aGF0IHB1dHMgdGhl
IGxpbmsgaW50byBMMi9MMy4gTm9uZSBvZiB0aGUgZmllbGRzIHRoZXkKPiA+ID4gPiBhY2Nlc3Mg
c2VlbSB0byB0b3VjaCB0aGUgR1BVIGl0c2VsZi4KPiA+ID4KPiA+ID4gU28gdGhhdCBtYXkgYmUg
d2hlcmUgdGhlIHByb2JsZW0gaXMuCj4gPiA+Cj4gPiA+IFB1dHRpbmcgdGhlIGRvd25zdHJlYW0g
Y29tcG9uZW50IGludG8gUENJIERbMS0zXSBpcyBleHBlY3RlZCB0byBwdXQKPiA+ID4gdGhlIGxp
bmsgaW50byBMMSwgc28gSSdtIG5vdCBzdXJlIGhvdyB0aGF0IHBsYXlzIHdpdGggdGhlIGxhdGVy
Cj4gPiA+IGF0dGVtcHQgdG8gcHV0IGl0IGludG8gTDIvTDMgUmVhZHkuCj4gPgo+ID4gVGhhdCBz
aG91bGQgYmUgZmluZS4gV2hhdCBJJ3ZlIHNlZW4gdGhlIGxpbmsgZ29lcyBpbnRvIEwxIHdoZW4K
PiA+IGRvd25zdHJlYW0gY29tcG9uZW50IGlzIHB1dCB0byBELXN0YXRlIChub3QgRDApIGFuZCB0
aGVuIGl0IGlzIHB1dCBiYWNrCj4gPiB0byBMMCB3aGVuIEwyLzMgcmVhZHkgaXMgcHJvcGFnYXRl
ZC4gRXZlbnR1YWxseSBpdCBnb2VzIGludG8gTDIgb3IgTDMuCj4KPiBXZWxsLCB0aGF0J3MgdGhl
IGV4cGVjdGVkIGJlaGF2aW9yLCBidXQgdGhlIG9ic2VydmVkIGJlaGF2aW9yIGlzbid0IGFzCj4g
ZXhwZWN0ZWQuIDotKQo+Cj4gPiA+IEFsc28sIEwyL0wzIFJlYWR5IGlzIGV4cGVjdGVkIHRvIGJl
IHRyYW5zaWVudCwgc28gZmluYWxseSBwb3dlciBzaG91bGQKPiA+ID4gYmUgcmVtb3ZlZCBzb21l
aG93Lgo+ID4KPiA+IFRoZXJlIGlzIEdQSU8gZm9yIGJvdGggcG93ZXIgYW5kIFBFUlNULCBJIHRo
aW5rIHRoZSBsaW5lIGhlcmU6Cj4gPgo+ID4gICBcX1NCLlNHT1YgKDB4MDEwMTAwMDQsIFplcm8p
Cj4gPgo+ID4gaXMgdGhlIG9uZSB0aGF0IHJlbW92ZXMgcG93ZXIuCj4KPiBPSwo+Cj4gPiA+ID4g
TEtEUygpIGZvciB0aGUgZmlyc3QgUEVHIHBvcnQgbG9va3MgbGlrZSB0aGlzOgo+ID4gPiA+Cj4g
PiA+ID4gICAgUDBMMiA9IE9uZQo+ID4gPiA+ICAgIFNsZWVwICgweDEwKQo+ID4gPiA+ICAgIExv
Y2FsMCA9IFplcm8KPiA+ID4gPiAgICBXaGlsZSAoUDBMMikKPiA+ID4gPiAgICB7Cj4gPiA+ID4g
ICAgICAgICBJZiAoKExvY2FsMCA+IDB4MDQpKQo+ID4gPiA+ICAgICAgICAgewo+ID4gPiA+ICAg
ICAgICAgICAgIEJyZWFrCj4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAg
IFNsZWVwICgweDEwKQo+ID4gPiA+ICAgICAgICAgTG9jYWwwKysKPiA+ID4gPiAgICB9Cj4gPiA+
ID4KPiA+ID4gPiBPbmUgdGhpbmcgdGhhdCBjb21lcyB0byBtaW5kIGlzIHRoYXQgdGhlIGxvb3Ag
Y2FuIGVuZCBldmVuIGlmIFAwTDIgaXMKPiA+ID4gPiBub3QgY2xlYXJlZCBhcyBpdCBkb2VzIG9u
bHkgNSBpdGVyYXRpb25zIHdpdGggMTYgbXMgc2xlZXAgYmV0d2Vlbi4gTWF5YmUKPiA+ID4gPiBT
bGVlcCgpIGlzIGltcGxlbWVudGVkIGRpZmZlcmVudGx5IGluIFdpbmRvd3M/IEkgbWVhbiBMaW51
eCBtYXkgYmUKPiA+ID4gPiAiZmFzdGVyIiBoZXJlIGFuZCByZXR1cm4gcHJlbWF0dXJlbHkgYW5k
IGlmIHdlIGxlYXZlIHRoZSBwb3J0IGludG8gRDAKPiA+ID4gPiB0aGlzIGRvZXMgbm90IGhhcHBl
biwgb3Igc29tZXRoaW5nLiBJJ20ganVzdCB0aHJvd2luZyBvdXQgaWRlYXMgOikKPiA+ID4KPiA+
ID4gQnV0IHRoaXMgYWN0dWFsbHkgd29ya3MgZm9yIHRoZSBkb3duc3RyZWFtIGNvbXBvbmVudCBp
biBEMCwgZG9lc24ndCBpdD8KPiA+Cj4gPiBJdCBkb2VzIGFuZCB0aGF0IGxlYXZlcyB0aGUgbGlu
ayBpbiBMMCBzbyBpdCBjb3VsZCBiZSB0aGF0IHRoZW4gdGhlCj4gPiBhYm92ZSBBTUwgd29ya3Mg
YmV0dGVyIG9yIHNvbWV0aGluZy4KPgo+IFRoYXQgd291bGQgYmUgbXkgZ3Vlc3MuCj4KPiA+IFRo
YXQgcmVtaW5kcyBtZSwgQVNQTSBtYXkgaGF2ZSBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGlzIGFz
IHdlbGwuCj4KPiBOb3QgcmVhbGx5IGlmIEQtc3RhdGVzIGFyZSBpbnZvbHZlZC4KPgo+ID4gPiBB
bHNvLCBpZiB0aGUgZG93bnN0cmVhbSBjb21wb25lbnQgaXMgaW4gRDAsIHRoZSBwb3J0IGFjdHVh
bGx5IHNob3VsZAo+ID4gPiBzdGF5IGluIEQwIHRvbywgc28gd2hhdCB3b3VsZCBoYXBwZW4gd2l0
aCB0aGUgJHN1YmplY3QgcGF0Y2ggYXBwbGllZD8KPiA+Cj4gPiBQYXJlbnQgcG9ydCBjYW5ub3Qg
YmUgbG93ZXIgRC1zdGF0ZSB0aGFuIHRoZSBjaGlsZCBzbyBJIGFncmVlIGl0IHNob3VsZAo+ID4g
c3RheSBpbiBEMCBhcyB3ZWxsLiBIb3dldmVyLCBpdCBzZWVtcyB0aGF0IHdoYXQgaGFwcGVucyBp
cyB0aGF0IHRoZQo+ID4gaXNzdWUgZ29lcyBhd2F5IDopCj4KPiBXZWxsLCBhdCBsZWFzdCB0aGlz
IGlzIGtpbmQgb2Ygb3V0IG9mIHRoZSBzcGVjLgo+Cj4gTm90ZSB0aGF0IHBjaV9wbV9zdXNwZW5k
X25vaXJxKCkgd29uJ3QgbGV0IHRoZSBwb3J0IGdvIGludG8gRDMgaWYgdGhlCj4gZG93bnN0cmVh
bSBkZXZpY2UgaXMgaW4gRDAsIHNvIHRoZSAkc3ViamVjdCBwYXRjaCB3aWxsIG5vdCB3b3JrIGFz
Cj4gZXhwZWN0ZWQgaW4gdGhlIHN1c3BlbmQtdG8taWRsZSBjYXNlLgo+Cj4gQWxzbyB3ZSByZWFs
bHkgc2hvdWxkIG1ha2UgdXAgb3VyIG1pbmRzIG9uIHdoZXRoZXIgb3Igbm90IHRvIGZvcmNlCj4g
UENJZSBwb3J0cyB0byBzdGF5IGluIEQwIHdoZW4gZG93bnN0cmVhbSBkZXZpY2VzIGFyZSBpbiBE
MCBhbmQgYmUKPiBjb25zZXF1ZW50IGFib3V0IHRoYXQuICBSaWdodCBub3cgd2UgZG8gb25lIHRo
aW5nIGR1cmluZyBzeXN0ZW0td2lkZQo+IHN1c3BlbmQgYW5kIHRoZSBvdGhlciBvbmUgaW4gUE0t
cnVudGltZSwgd2hpY2ggaXMgY29uZnVzaW5nLgo+Cj4gVGhlIGN1cnJlbnQgZGVzaWduIGlzIG1v
c3RseSBiYXNlZCBvbiB0aGUgUENJIFBNIFNwZWMgMS4yLCBzbyBpdCB3b3VsZAo+IGJlIGNvbnNl
cXVlbnQgdG8gZm9sbG93IHN5c3RlbS13aWRlIHN1c3BlbmQgaW4gUE0tcnVudGltZSBhbmQgYXZv
aWQKPiBwdXR0aW5nIFBDSWUgcG9ydHMgaG9sZGluZyBkZXZpY2VzIGluIEQwIGludG8gYW55IGxv
dy1wb3dlciBzdGF0ZXMuCj4gYnV0IHRoYXQgd291bGQgbWFrZSB0aGUgYXBwcm9hY2ggaW4gdGhl
ICRzdWJqZWN0IHBhdGNoIGluZWZmZWN0aXZlLgo+Cj4gTW9yZW92ZXIsIHRoZSBmYWN0IHRoYXQg
dGhlcmUgYXJlIHNlcGFyYXRlIGJyYW5jaGVzIGZvciAiV2luZG93cyA3Igo+IGFuZCAiV2luZG93
cyA4KyIga2luZCBvZiBzdWdnZXN0IGEgY2hhbmdlIGluIHRoZSBleHBlY3RlZCBiZWhhdmlvcgo+
IGJldHdlZW4gV2luZG93cyA3IGFuZCBXaW5kb3dzIDgsIGZyb20gdGhlIEFNTCBwZXJzcGVjdGl2
ZS4gIEkgd291bGQKPiBndWVzcyB0aGF0IFdpbmRvd3MgNyBmb2xsb3dlZCBQQ0kgUE0gMS4yIGFu
ZCBXaW5kb3dzIDggKGFuZCBsYXRlcikKPiBkb2VzIHNvbWV0aGluZyBlbHNlLiAgTm93LCB0aGUg
c3RydWN0dXJlIG9mIHRoZSAiV2luZG93cyA4KyIgYnJhbmNoCj4gZGVzY3JpYmVkIGJ5IHlvdSBz
dWdnZXN0cyB0aGF0LCBhdCBsZWFzdCBpbiB0aGUgY2FzZXMgd2hlbiBpdCBpcyBnb2luZwo+IHRv
IHJlbW92ZSBwb3dlciBmcm9tIHRoZSBwb3J0IGV2ZW50dWFsbHksIGl0IGdvZXMgc3RyYWlnaHQg
Zm9yIHRoZQo+IGxpbmsgcHJlcGFyYXRpb24gKHRoZSBMMi9MMyBSZWFkeSB0cmFuc2l0aW9uKSBh
bmQgcG93ZXIgcmVtb3ZhbAo+IHdpdGhvdXQgYm90aGVyaW5nIHRvIHByb2dyYW0gdGhlIGRvd25z
dHJlYW0gZGV2aWNlIGFuZCBwb3J0IGludG8gRDNob3QKPiAoYmVjYXVzZSB0aGF0J3Mga2luZCBv
ZiByZWR1bmRhbnQpLgo+Cj4gVGhhdCBoeXBvdGhldGljYWwgIldpbmRvd3MgOCsiIGFwcHJvYWNo
IG1heSByZWFsbHkgd29yayB1bml2ZXJzYWxseSwKPiBiZWNhdXNlIGl0IGRvZXNuJ3Qgc2VlbSB0
byBicmVhayBhbnkgcnVsZXMgKGdvaW5nIHN0cmFpZ2h0IGZyb20gRDAgdG8KPiBEM2NvbGQgaXMg
bm90IGRpc2FsbG93ZWQgYW5kIGRvaW5nIHRoYXQgZm9yIGJvdGggYSBwb3J0IGFuZCBhCj4gZG93
bnN0cmVhbSBkZXZpY2UgYXQgdGhlIHNhbWUgdGltZSBpcyBraW5kIG9mIE9LIGVpdGhlciwgYXMg
bG9uZyBhcwo+IHRoZSBsaW5rIGlzIHJlYWR5IGZvciB0aGF0KS4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
