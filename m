Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1FC2F61
	for <lists+nouveau@lfdr.de>; Tue,  1 Oct 2019 10:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ADC6E5BD;
	Tue,  1 Oct 2019 08:56:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848686E5BD
 for <nouveau@lists.freedesktop.org>; Tue,  1 Oct 2019 08:56:52 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14DD45945E
 for <nouveau@lists.freedesktop.org>; Tue,  1 Oct 2019 08:56:52 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id z10so37179097ioj.1
 for <nouveau@lists.freedesktop.org>; Tue, 01 Oct 2019 01:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4MCB39tSojzPSG5F8motQYTFmJxxDn1nUNabNxkafU=;
 b=L7B2kn1nVD4495UbH7VUT0ASoQ04hipeRhFVtSQ1uHCF/MQ2VH2OWXSkT5oWkcvw8z
 SnGaVAD6VtBdvkEktn3EPVRiPMPN3g+UE+plhXaqOYgWXrvAnqQwovp/oNq5XQXoyEt1
 dctL4uJSUIQSi+PcD5TFaiONve3qtqD4VKXiQcadRMwb9jqRq18dqYkmmjak8j/GZV0W
 uIS/HCpvQdg6hXAZzlxYWUe7IhtuwYUYb9t4/qJqr5VEEvegfiujYn8qN0cHgFF5ZF9b
 JESeb/y3O9FypEMZtnKyoXTVAF9FPIL/jD/kjsY0ko6KR+iSafILDZemcq7UtPtnKwwZ
 Vw9g==
X-Gm-Message-State: APjAAAVCrRDz7ulx2t4g+A0c2yNQRK6N9pY3fCvIepjd1H+o6GRLweBO
 EE0a5PqdhOirRvbPMW6jYKOwkSscR19DWLzks/AF05i7ETNgNl32XSXwaP+2YpGotCG4tnnymoo
 E7TdLz0ef17M/ypnI7Bjww2sgGdVeQjzcDb80ZHgypw==
X-Received: by 2002:a02:3785:: with SMTP id r127mr23230734jar.40.1569920211282; 
 Tue, 01 Oct 2019 01:56:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoNzktoaUof8b0H3sFnkM9bXtOd3VgXH5Bw47BtxohVXwwNwKIPvNn8hjvUfNCqV1BTAm2hn7ua8hYHfXP2xc=
X-Received: by 2002:a02:3785:: with SMTP id r127mr23230713jar.40.1569920210929; 
 Tue, 01 Oct 2019 01:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
 <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
 <20190930163001.GX2714@lahna.fi.intel.com>
 <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
 <20191001084651.GC2714@lahna.fi.intel.com>
In-Reply-To: <20191001084651.GC2714@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Oct 2019 10:56:39 +0200
Message-ID: <CACO55ts9ommYbA5g4=G+f0G=v90qGM7EsurU7AL7bU=PFzQMnw@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [Nouveau] [RFC PATCH] pci: prevent putting pcie devices into
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMDo0NyBBTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMDY6MzY6MTJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gTW9uLCBTZXAg
MzAsIDIwMTkgYXQgNjozMCBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMDY6MDU6MTRQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+IHN0aWxsIGhh
cHBlbnMgd2l0aCB5b3VyIHBhdGNoIGFwcGxpZWQuIFRoZSBtYWNoaW5lIHNpbXBseSBnZXRzIHNo
dXQgZG93bi4KPiA+ID4gPgo+ID4gPiA+IGRtZXNnIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gPiA+
IGh0dHBzOi8vZ2lzdC5naXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvNDBlYjA5MWM3
YjdiMzNlZjk5MzUyNWRlNjYwZjFhM2IvcmF3LzIzODBlMzFmNTY2ZTkzZTViYTdjODdlZjU0NTQy
MDk2NWQ0YzQ5MmMvZ2lzdGZpbGUxLnR4dAo+ID4gPgo+ID4gPiBMb29raW5nIHlvdXIgZG1lc2c6
Cj4gPiA+Cj4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4w
OiBEUk06IERDQiB2ZXJzaW9uIDQuMQo+ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBub3V2
ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBNTTogdXNpbmcgQ09QWSBmb3IgYnVmZmVyIGNvcGllcwo+
ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBbZHJtXSBJbml0aWFsaXplZCBub3V2ZWF1IDEu
My4xIDIwMTIwODAxIGZvciAwMDAwOjAxOjAwLjAgb24gbWlub3IgMQo+ID4gPgo+ID4gPiBJIHdv
dWxkIGFzc3VtZSBpdCBydW50aW1lIHN1c3BlbmRzIGhlcmUuIFRoZW4gaXQgd2FrZXMgdXAgYmVj
YXVzZSBvZiBQQ0kKPiA+ID4gYWNjZXNzIGZyb20gdXNlcnNwYWNlOgo+ID4gPgo+ID4gPiBTZXAg
MzAgMTc6MjQ6NDIga2VybmVsOiBwY2lfcmF3X3NldF9wb3dlcl9zdGF0ZTogNTYgY2FsbGJhY2tz
IHN1cHByZXNzZWQKPiA+ID4KPiA+ID4gYW5kIGZvciBzb21lIHJlYXNvbiBpdCBkb2VzIG5vdCBn
ZXQgcmVzdW1lZCBwcm9wZXJseS4gVGhlcmUgYXJlIGFsc28gZmV3Cj4gPiA+IHdhcm5pbmdzIGZy
b20gQUNQSSB0aGF0IG1pZ2h0IGJlIHJlbGV2YW50Ogo+ID4gPgo+ID4gPiBTZXAgMzAgMTc6MjQ6
Mjcga2VybmVsOiBBQ1BJIFdhcm5pbmc6IFxfU0IuUENJMC5HRlgwLl9EU006IEFyZ3VtZW50ICM0
IHR5cGUgbWlzbWF0Y2ggLSBGb3VuZCBbQnVmZmVyXSwgQUNQSSByZXF1aXJlcyBbUGFja2FnZV0g
KDIwMTkwNTA5L25zYXJndW1lbnRzLTU5KQo+ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBB
Q1BJIFdhcm5pbmc6IFxfU0IuUENJMC5QRUcwLlBFR1AuX0RTTTogQXJndW1lbnQgIzQgdHlwZSBt
aXNtYXRjaCAtIEZvdW5kIFtCdWZmZXJdLCBBQ1BJIHJlcXVpcmVzIFtQYWNrYWdlXSAoMjAxOTA1
MDkvbnNhcmd1bWVudHMtNTkpCj4gPiA+Cj4gPgo+ID4gYWZhaWsgdGhpcyBpcyB0aGUgY2FzZSBm
b3IgZXNzZW50aWFsbHkgZXZlcnkgbGFwdG9wIG91dCB0aGVyZS4KPgo+IE9LLCBzbyB0aGV5IGFy
ZSBoYXJtbGVzcz8KPgoKeWVzCgo+ID4gPiBUaGlzIHNlZW1zIHRvIGJlIERlbGwgWFBTIDk1NjAg
d2hpY2ggSSB0aGluayBoYXMgYmVlbiBhcm91bmQgc29tZSB0aW1lCj4gPiA+IGFscmVhZHkgc28g
SSB3b25kZXIgd2h5IHdlIG9ubHkgc2VlIGlzc3VlcyBub3cuIEhhcyBpdCBldmVyIHdvcmtlZCBm
b3IKPiA+ID4geW91IG9yIG1heWJlIHRoZXJlIGlzIGEgcmVncmVzc2lvbiB0aGF0IGNhdXNlcyBp
dCB0byBoYXBwZW4gbm93Pwo+ID4KPiA+IG9oLCBpdCdzIGJyb2tlbiBzaW5jZSBmb3JldmVyLCB3
ZSBqdXN0IHRyaWVkIHRvIGdldCBtb3JlIGluZm9ybWF0aW9uCj4gPiBmcm9tIE52aWRpYSBpZiB0
aGV5IGtub3cgd2hhdCB0aGlzIGlzIGFsbCBhYm91dCwgYnV0IHdlIGdvdCBub3RoaW5nCj4gPiB1
c2VmdWwuCj4gPgo+ID4gV2Ugd2VyZSBhbHNvIGhvcGluZyB0byBmaW5kIGEgcmVsaWFibGUgZml4
IG9yIHdvcmthcm91bmQgd2UgY291bGQgaGF2ZQo+ID4gaW5zaWRlIG5vdXZlYXUgdG8gZml4IHRo
YXQgYXMgSSB0aGluayBub3V2ZWF1IGlzIHRoZSBvbmx5IGRyaXZlcgo+ID4gYWN0dWFsbHkgaGl0
IGJ5IHRoaXMgaXNzdWUsIGJ1dCBub3RoaW5nIHR1cm5lZCBvdXQgdG8gYmUgcmVsaWFibGUKPiA+
IGVub3VnaC4KPgo+IENhbid0IHlvdSBqdXN0IGJsb2NrIHJ1bnRpbWUgUE0gZnJvbSB0aGUgbm91
dmVhdSBkcml2ZXIgdW50aWwgdGhpcyBpcwo+IHVuZGVyc3Rvb2QgYmV0dGVyPyBUaGF0IGNhbiBi
ZSBkb25lIGJ5IGNhbGxpbmcgcG1fcnVudGltZV9mb3JiaWQoKSAob3IKPiBub3QgY2FsbGluZyBw
bV9ydW50aW1lX2FsbG93KCkgaW4gdGhlIGRyaXZlcikuIE9yIGluIGNhc2Ugb2YgUENJIGRyaXZl
cgo+IHlvdSBqdXN0IGRvbid0IGRlY3JlYXNlIHRoZSByZWZlcmVuY2UgY291bnQgd2hlbiBwcm9i
ZSgpIGVuZHMuCj4KCnRoZSB0aGluZyBpcywgaXQgZG9lcyB3b3JrIGZvciBhIGxvdCBvZiBsYXB0
b3BzLiBXZSBjb3VsZCBvbmx5IG9ic2VydmUKdGhpcyBvbiBrYWJ5IGxha2UgYW5kIHNreWxha2Ug
b25lcy4gRXZlbiBvbiBDYW5ub24gTGFrZXMgaXQgc2VlbXMgdG8Kd29yayBqdXN0IGZpbmUuCgo+
IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBtdWNoIGJldHRlciB0aGFuIGJsb2NraW5nIGFueSBkZXZp
Y2VzIGJlaGluZAo+IEthYnlsYWtlIFBDSWUgcm9vdCBwb3J0cyBmcm9tIGVudGVyaW5nIEQzIChJ
IGRvbid0IHJlYWxseSB0aGluayB0aGUKPiBwcm9ibGVtIGlzIGluIHRoZSByb290IHBvcnRzIGl0
c2VsZiBidXQgdGhlcmUgaXMgc29tZXRoaW5nIHdlIGFyZQo+IG1pc3Npbmcgd2hlbiB0aGUgTlZJ
RElBIEdQVSBpcyBwdXQgaW50byBEM2NvbGQgb3IgYmFjayBmcm9tIHRoZXJlKS4KCkkgaGlnaGx5
IGRvdWJ0IHRoZXJlIGlzIGFueXRoaW5nIHdyb25nIHdpdGggdGhlIEdQVSBhbG9uZSBhcyB3ZSBo
YXZlCnRvbyBtYW55IGluZGljYXRpb25zIHdoaWNoIHRlbGwgdXMgb3RoZXJ3aXNlLgoKQW55d2F5
LCBhdCB0aGlzIHBvaW50IEkgZG9uJ3Qga25vdyB3aGVyZSB0byBsb29rIGZ1cnRoZXIgZm9yIHdo
YXQncwphY3R1YWxseSB3cm9uZy4gQW5kIGFwcGFyZW50bHkgaXQgd29ya3Mgb24gV2luZG93cywg
YnV0IEkgZG9uJ3Qga25vdwp3aHkgYW5kIEkgaGF2ZSBubyBpZGVhIHdoYXQgV2luZG93cyBkb2Vz
IG9uIHN1Y2ggc3lzdGVtcyB0byBtYWtlIGl0CndvcmsgcmVsaWFibHkuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
