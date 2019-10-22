Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892BCE042E
	for <lists+nouveau@lfdr.de>; Tue, 22 Oct 2019 14:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55576E798;
	Tue, 22 Oct 2019 12:52:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492F76E593
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 12:52:06 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB95B859FF
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 12:52:05 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id s14so16540039qkg.12
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 05:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3yeQelJTclqqXcJSeLCRYJucLdCvZTdooL8LQ/VknXg=;
 b=GO5FS0Jv30rR/dMIqh30EKf3+WEXC2h0gpOmNv9kOKjdCFOWqEuLaZynq07qZJJTaA
 QRLqyRDPT+8QmDrHZ2J12Atv8kN7SQbYrcIziHLH+uheC6KbbwgA3Mp5AMVBA3yw5Nks
 v7bVxQOPpCUMqsieUGa/iSiq4ry6Qp21YExsYBPT20pnDhLmVWD5Vq5Hw/03sCZRKnwf
 8TACWWmPCxIh/lDogWnHd9AYWXchL+xLa9s376ItUcsdpZtoeSwm/niCp6TPDCdBm2n2
 HzoTEVhQSHcFLNWowOJd83DzTJ2ojzo0+xf1eUz3qb1WgJ2CYKMcFZGU4IbQOTUM/AvM
 n8qw==
X-Gm-Message-State: APjAAAXdn+ArmaBED97KufftntK1FnWWfc7SykZKCJOLi17LBpWHuMIC
 +rtRODUcGrG9SjGq2Obcg9UjHB0FKW67EHizRhZQVBOuQyj1bAhtVyvIIelNL9gHoSYlFfzYTBm
 Yzd9EYLi6CaQ5ZtqyO+J9S+tbHqkFM8DAyIqAAcW3rw==
X-Received: by 2002:a37:9c0f:: with SMTP id f15mr2853219qke.62.1571748724999; 
 Tue, 22 Oct 2019 05:52:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTSf/89W7mLASTE6fmyhuNivQ1p+xmXUQgPgY57L2MD0+HVVER/VSyOJiIJsiIDyT24Z8QmXi/IjC27y0EsqE=
X-Received: by 2002:a37:9c0f:: with SMTP id f15mr2853196qke.62.1571748724699; 
 Tue, 22 Oct 2019 05:52:04 -0700 (PDT)
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
 <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
 <20191022124453.GK2819@lahna.fi.intel.com>
In-Reply-To: <20191022124453.GK2819@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 22 Oct 2019 14:51:53 +0200
Message-ID: <CACO55tvxvwUqzg=jLoO6bhmcaXQwRaTv9S4pt2t0V5TUi+HsEw@mail.gmail.com>
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMjo0NSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6
MTY6MTRBTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gSSB0aGluayB0aGVyZSBpcyBz
b21ldGhpbmcgSSB0b3RhbGx5IGZvcmdvdCBhYm91dDoKPiA+Cj4gPiBXaGVuIHRoZXJlIHdhcyBu
ZXZlciBhIGRyaXZlciBib3VuZCB0byB0aGUgR1BVLCBhbmQgaWYgcnVudGltZSBwb3dlcgo+ID4g
bWFuYWdlbWVudCBnZXRzIGVuYWJsZWQgb24gdGhhdCBkZXZpY2UsIHJ1bnRpbWUgc3VzcGVuZC9y
ZXN1bWUgd29ya3MKPiA+IGFzIGV4cGVjdGVkIChJIGFtIG5vdCAxMDAlIHN1cmUgb24gaWYgdGhh
dCBhbHdheXMgd29ya3MsIGJ1dCBJIHdpbGwKPiA+IHJlY2hlY2sgdGhhdCkuCj4KPiBBRkFJSywg
aWYgdGhlcmUgaXMgbm8gZHJpdmVyIGJvdW5kIHRvIHRoZSBQQ0kgZGV2aWNlIGl0IGlzIGxlZnQg
dG8gRDAKPiByZWdhcmRsZXNzIG9mIHRoZSBydW50aW1lIFBNIHN0YXRlIHdoaWNoIGNvdWxkIGV4
cGxhaW4gd2h5IGl0IHdvcmtzIGluCj4gdGhhdCBjYXNlIChpdCBpcyBuZXZlciBwdXQgaW50byBE
M2hvdCkuCj4KPiBJIGxvb2tlZCBhdCB0aGUgYWNwaWR1bXAgeW91IHNlbnQgYW5kIHRoZXJlIGlz
IG9uZSB0aGluZyB0aGF0IG1heQo+IGV4cGxhaW4gdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gV2lu
ZG93cyBhbmQgTGludXguIE5vdCBzdXJlIGlmIHlvdSB3ZXJlCj4gYXdhcmUgb2YgdGhpcyBhbHJl
YWR5LCB0aG91Z2guIFRoZSBwb3dlciByZXNvdXJjZSBQR09GKCkgbWV0aG9kIGhhcwo+IHRoaXM6
Cj4KPiAgICBJZiAoKChPU1lTIDw9IDB4MDdEOSkgfHwgKChPU1lTID09IDB4MDdERikgJiYgKF9S
RVYgPT0gMHgwNSkpKSkgewo+ICAgICAgIC4uLgo+ICAgIH0KPgoKSSB0aGluayB0aGlzIGlzIHRo
ZSBmYWxsYmFjayB0byBzb21lIG9sZGVyIG1ldGhvZCBvZiBydW50aW1lCnN1c3BlbmRpbmcgdGhl
IGRldmljZSwgYW5kIEkgdGhpbmsgaXQgd2lsbCBlbmQgdXAgdG91Y2hpbmcgZGlmZmVyZW50CnJl
Z2lzdGVycyBvbiB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgd2hpY2ggZG8gbm90IHNob3cgdGhlIGJy
b2tlbgpiZWhhdmlvdXIuCgpZb3UnbGwgZmluZCByZWZlcmVuY2VzIHRvIGZvbGxvd2luZyB2YXJp
YWJsZXMgd2hpY2ggYWxsIGNhdXNlIGEgbGluawp0byBiZSBwb3dlcmVkIGRvd246IFEwTDIgKG5l
d2VzdCksIFAwTDIsIFAwTEQgKG9sZGVzdCwgSSB0aGluaykuCgpNYXliZSBJIHJlbWVtYmVyIGlu
Y29ycmVjdGx5IGFuZCBoYXZlIHRvIHJlYWQgdGhlIGNvZGUgYWdhaW4uLi4gb2theSwKdGhlIGZh
bGxiYWNrIHBhdGggdXNlcyBQMExEIGluZGVlZC4gVGhhdCdzIGFjdHVhbGx5IHRoZSBvbmx5IHJl
Z2lzdGVyCm9mIHRob3NlIGJlaW5nIGRvY3VtZW50ZWQgYnkgSW50ZWwgYWZhaWsuCgo+IElmIEkg
cmVhZCBpdCByaWdodCwgdGhlIGxhdGVyIGNvbmRpdGlvbiB0cmllcyB0byBkZXRlY3QgTGludXgg
d2hpY2gKPiBmYWlscyBub3dhZGF5cyBidXQgaWYgeW91IGhhdmUgYWNwaV9yZXZfb3ZlcnJpZGUg
aW4gdGhlIGNvbW1hbmQgbGluZSAob3IKPiB0aGUgbWFjaGluZSBpcyBsaXN0ZWQgaW4gYWNwaV9y
ZXZfZG1pX3RhYmxlKSB0aGlzIGNoZWNrIHBhc3NlcyBhbmQgZG9lcwo+IHNvbWUgbWFnaWMgd2hp
Y2ggaXMgbm90IGNsZWFyIHRvIG1lLiBUaGVyZSBpcyBzaW1pbGFyIGluIFBHT04oKSBzaWRlCj4g
d2hpY2ggaXMgdXNlZCB0byB0dXJuIHRoZSBkZXZpY2UgYmFjayBvbi4KPgo+IFlvdSBjYW4gY2hl
Y2sgd2hhdCBhY3R1YWxseSBoYXBwZW5zIHdoZW4gX09OKCkvX09GRigpIGlzIGNhbGxlZCBieQo+
IHBhc3Npbmcgc29tZXRoaW5nIGxpa2UgYmVsb3cgdG8gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmU6
Cj4KPiAgIGFjcGkudHJhY2VfZGVidWdfbGF5ZXI9MHg4MCBhY3BpLnRyYWNlX2RlYnVnX2xldmVs
PTB4MTAgYWNwaS50cmFjZV9tZXRob2RfbmFtZT1cX1NCLlBDSTAuUEVHMC5QRzAwLl9PTiBhY3Bp
LnRyYWNlX3N0YXRlPW1ldGhvZAo+Cj4gKFNlZSBhbHNvIERvY3VtZW50YXRpb24vZmlybXdhcmUt
Z3VpZGUvYWNwaS9tZXRob2QtdHJhY2luZy5yc3QpLgo+Cj4gVHJhY2UgZ29lcyB0byBzeXN0ZW0g
ZG1lc2cuCgpUaGlzIHNvdW5kcyB0byBiZSB2ZXJ5IGhlbHBmdWwsIEknbGwgZ2l2ZSBpdCBhIHRy
eS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
