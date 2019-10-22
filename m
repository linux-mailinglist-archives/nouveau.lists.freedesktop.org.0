Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788FE007C
	for <lists+nouveau@lfdr.de>; Tue, 22 Oct 2019 11:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14666E4A7;
	Tue, 22 Oct 2019 09:16:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1A6E4A7
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 09:16:27 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 662BB8535D
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 09:16:26 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id j18so9418258qtp.23
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NaftjpZ7q0/7FUFVe9FC7tfQH1ZMRLJsGxSpJEAYR0=;
 b=Wg8dQ9itcJNYpdoctM0n7GYLMQLVW7Pkf5hHsjevxXloRXjrBO7nmyUOW+djDSY/5r
 7GE/2SHy1foiEe9qjZGzjjPXAirEAyTybsD05T6M+ReYBJCY70kwKyvpIiaaSEQxH6ao
 E21L2MHf4MT+uQDVA8q9ju3yYHEoLF/L8N1xxLAGhXUzvizY+pfUlttwwupJKVchDHVF
 +ZM06CBnxZI2d622zsL1Eg3+iynvU7X92bcit0vfh5Qa0v8BAqv1GG9cteg4Cu3fEhKe
 R9DUeHBhUAs70BdXKZUQfCxxs+/jPEGPQq5QwhLvYRv9QpjZdCbHO/JjAtc4L9zcY1bc
 FGrA==
X-Gm-Message-State: APjAAAWfN21wKD2cg+JoX9ijkK7Y+XQbSh/meIGCDNot5Q49pSkLIqii
 Ckx6gSgygfzN0Ina+rHW44ZENHWQnHOCFBe9e3oTUxxnn2vb4kpKeuKdv2qPQP7L+NWEZhyydBs
 gM3icnvo5b7HwCGMIkGKBiXFdi2HXq7wk+Ddk0x9Tiw==
X-Received: by 2002:ac8:664b:: with SMTP id j11mr2246842qtp.137.1571735785693; 
 Tue, 22 Oct 2019 02:16:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxh+htVaSt1EHk6f2pMjctNRL+6dMevykS1gSHbmTJ7kc2awbIl5sahcS8cpGCaPnstRND7kRjzMbWgqOesrio=
X-Received: by 2002:ac8:664b:: with SMTP id j11mr2246814qtp.137.1571735785316; 
 Tue, 22 Oct 2019 02:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
 <20191021154606.GT2819@lahna.fi.intel.com>
 <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
In-Reply-To: <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 22 Oct 2019 11:16:14 +0200
Message-ID: <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [Nouveau] [PATCH v3] pci: prevent putting nvidia GPUs into
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
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSB0aGluayB0aGVyZSBpcyBzb21ldGhpbmcgSSB0b3RhbGx5IGZvcmdvdCBhYm91dDoKCldoZW4g
dGhlcmUgd2FzIG5ldmVyIGEgZHJpdmVyIGJvdW5kIHRvIHRoZSBHUFUsIGFuZCBpZiBydW50aW1l
IHBvd2VyCm1hbmFnZW1lbnQgZ2V0cyBlbmFibGVkIG9uIHRoYXQgZGV2aWNlLCBydW50aW1lIHN1
c3BlbmQvcmVzdW1lIHdvcmtzCmFzIGV4cGVjdGVkIChJIGFtIG5vdCAxMDAlIHN1cmUgb24gaWYg
dGhhdCBhbHdheXMgd29ya3MsIGJ1dCBJIHdpbGwKcmVjaGVjayB0aGF0KS4KSW4gdGhlIHBhc3Qg
SSBrbm93IHRoYXQgYXQgc29tZSBwb2ludCBJICJiaXNlY3RlZCIgdGhlIG5vdXZlYXUgZHJpdmVy
CnRvIGZpZ3VyZSBvdXQgd2hhdCBhY3R1YWxseSBicmVha3MgaXQgYW5kIGZvdW5kIG91dCB0aGF0
IHNvbWUgc2NyaXB0CmV4ZWN1dGVkIHdpdGggdGhlIGhlbHAgb2YgYW4gb24tY2hpcCBlbmdpbmUg
KHNpZ25lZCBzY3JpcHQsIHNpZ25lZApmaXJtd2FyZSwgYm90aCB2YmlvcyBwcm92aWRlZCkgbWFr
ZXMgaXQgYnJlYWsuIERlYnVnZ2luZyB0aGUgc2NyaXB0CmxlYWQgbWUgdG8gdGhlIFBDSWUgbGlu
ayBzcGVlZCBjaGFuZ2VzIGRvbmUgaW5zaWRlIHRoZSBzY3JpcHQgYnJlYWtpbmcKaXQuCgpCdXQg
YXMgInJldmVydGluZyIgdGhlIHNwZWVkIGNoYW5nZSBkaWRuJ3QgbWFrZSBpdCB3b3JrIHJlbGlh
Ymx5CmFnYWluLCBJIHRoaW5rIEkgbmVlZCB0byBnZXQgYmFjayBvbiB0aGF0IGFuZCBjaGVjayBp
ZiBpdCdzIHNvbWV0aGluZwplbHNlLiBJIHdpbGwgdHJ5IHRvIGNvbnZlcnQgdGhlIHNjcmlwdCBp
bnRvIEMgb3IgcHl0aG9uIGNvZGUgdG8gbWFrZQppdCBtb3JlIGFjY2Vzc2libGUgdG8gZGVidWcg
YW5kIGhvcGVmdWxseSBJJ2xsIGZpbmQgc29tZXRoaW5nIEkKb3Zlcmxvb2tlZCB0aGUgbGFzdCB0
aW1lLgoKT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNjo0MCBQTSBLYXJvbCBIZXJic3QgPGtoZXJi
c3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCA1OjQ2IFBN
IE1pa2EgV2VzdGVyYmVyZwo+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAwNDo0OTowOVBNICswMjAwLCBLYXJvbCBIZXJi
c3Qgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDQ6MDkgUE0gTWlrYSBXZXN0
ZXJiZXJnCj4gPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAzOjU0OjA5UE0gKzAyMDAsIEthcm9sIEhl
cmJzdCB3cm90ZToKPiA+ID4gPiA+ID4gSSByZWFsbHkgd291bGQgbGlrZSB0byBwcm92aWRlIHlv
dSBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN1Y2gKPiA+ID4gPiA+ID4gd29ya2Fyb3VuZCBidXQg
SSdtIG5vdCBhd2FyZSBvZiBhbnkgOy0pIEkgaGF2ZSBub3Qgc2VlbiBhbnkgaXNzdWVzIGxpa2UK
PiA+ID4gPiA+ID4gdGhpcyB3aGVuIEQzY29sZCBpcyBwcm9wZXJseSBpbXBsZW1lbnRlZCBpbiB0
aGUgcGxhdGZvcm0uICBUaGF0J3Mgd2h5Cj4gPiA+ID4gPiA+IEknbSBiaXQgc2tlcHRpY2FsIHRo
YXQgdGhpcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCBzcGVjaWZpYyBJbnRlbCBQQ0llCj4gPiA+
ID4gPiA+IHBvcnRzLiBNb3JlIGxpa2VseSBpdCBpcyBzb21lIHBvd2VyIHNlcXVlbmNlIGluIHRo
ZSBfT04vX09GRigpIG1ldGhvZHMKPiA+ID4gPiA+ID4gdGhhdCBpcyBydW4gZGlmZmVyZW50bHkg
b24gV2luZG93cy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiB5ZWFoLi4gbWF5YmUuIEkgcmVhbGx5IGRv
bid0IGtub3cgd2hhdCdzIHRoZSBhY3R1YWwgcm9vdCBjYXVzZS4gSSBqdXN0Cj4gPiA+ID4gPiBr
bm93IHRoYXQgd2l0aCB0aGlzIHdvcmthcm91bmQgaXQgd29ya3MgcGVyZmVjdGx5IGZpbmUgb24g
bXkgYW5kIHNvbWUKPiA+ID4gPiA+IG90aGVyIHN5c3RlbXMgaXQgd2FzIHRlc3RlZCBvbi4gRG8g
eW91IGtub3cgd2hvIHdvdWxkIGJlIGJlc3QgdG8KPiA+ID4gPiA+IGFwcHJvYWNoIHRvIGdldCBw
cm9wZXIgZG9jdW1lbnRhdGlvbiBhYm91dCB0aG9zZSBtZXRob2RzIGFuZCB3aGF0IGFyZQo+ID4g
PiA+ID4gdGhlIGFjdHVhbCBwcmVyZXF1aXNpdGVzIG9mIHRob3NlIG1ldGhvZHM/Cj4gPiA+ID4K
PiA+ID4gPiBUaG9zZSBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiB0aGUgQUNQSSBzcGVjLiBDaGFw
dGVyIDcgc2hvdWxkIGV4cGxhaW4KPiA+ID4gPiBwb3dlciByZXNvdXJjZXMgYW5kIHRoZSBkZXZp
Y2UgcG93ZXIgbWV0aG9kcyBpbiBkZXRhaWwuCj4gPiA+Cj4gPiA+IGVpdGhlciBJIGxvb2tlZCB1
cCB0aGUgd3Jvbmcgc3BlYyBvciB0aGUgZG9jdW1lbnRhdGlvbiBpc24ndCByZWFsbHkKPiA+ID4g
c2F5aW5nIG11Y2ggdGhlcmUuCj4gPgo+ID4gV2VsbCBpdCBleHBsYWlucyB0aG9zZSBtZXRob2Rz
LCBfUFN4LCBfUFJ4IGFuZCBfT04oKS9fT0ZGKCkuIEluIGNhc2Ugb2YKPiA+IFBDSWUgZGV2aWNl
IHlvdSBhbHNvIHdhbnQgdG8gY2hlY2sgUENJZSBzcGVjLiBQQ0llIDUuMCBzZWN0aW9uIDUuOCAi
UENJCj4gPiBGdW5jdGlvbiBQb3dlciBTdGF0ZSBUcmFuc2l0aW9ucyIgaGFzIGEgcGljdHVyZSBh
Ym91dCB0aGUgc3VwcG9ydGVkCj4gPiBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyBhbmQgdGhlcmUg
d2UgY2FuIGZpbmQgdGhhdCBmdW5jdGlvbiBtdXN0IGJlIGluCj4gPiBEM2hvdCBiZWZvcmUgaXQg
Y2FuIGJlIHRyYW5zaXRpb25lZCBpbnRvIEQzY29sZCBzbyBpZiB0aGUgX09GRigpIGZvcgo+ID4g
ZXhhbXBsZSBibGluZGx5IGFzc3VtZXMgdGhhdCB0aGUgZGV2aWNlIGlzIGluIEQwIHdoZW4gaXQg
aXMgY2FsbGVkLCBpdAo+ID4gaXMgYSBidWcgaW4gdGhlIEJJT1MuCj4gPgo+ID4gQlRXLCB3aGVy
ZSBjYW4gSSBmaW5kIGFjcGlkdW1wIG9mIHN1Y2ggc3lzdGVtPwo+Cj4gSSBhbSBzdXJlIGl0J3Mg
dXBsb2FkZWQgc29tZXdoZXJlIGFscmVhZHkuIEJ1dCBpdCdzIG5vdCBhbiBpc3N1ZSBvZgo+IGp1
c3Qgb25lIHN5c3RlbS4gSXQncyBlc3NlbnRpYWxseSBoaXR0aW5nIGV2ZXJ5IHNpbmdsZSBsYXB0
b3Agd2l0aCBhCj4gc2t5bGFrZSBvciBrYWJ5IGxha2UgQ1BVICsgTnZpZGlhIEdQVS4gSSBkaWRu
J3Qgc2VlIGFueSBzeXN0ZW0gd2hlcmUKPiBpdCdzIGFjdHVhbGx5IHdvcmtpbmcgcmlnaHQgbm93
IChhbmQgd2UgYXJlIHBlc3RlcmluZyBudmlkaWEgYWJvdXQKPiB0aGlzIGlzc3VlIGZvciBvdmVy
IGEgeWVhciBhbHJlYWR5IHdpdGggbm8gc29sdXRpb24pCj4KPiBJJ3ZlIGF0dGFjaGVkIGFuIGFj
cGlkdW1wIGZyb20gbXkgc3lzdGVtLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
