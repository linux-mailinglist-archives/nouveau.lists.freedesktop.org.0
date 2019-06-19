Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408664BE8E
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2019 18:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1A6E398;
	Wed, 19 Jun 2019 16:46:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0F56E443
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 16:46:34 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id l15so10339745otn.9
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 09:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAeca+NaeasgKg8wLjwxe/d8KFhZwiNtk4NpQn2oH10=;
 b=ADK0rcHS7U12a/iFqcdds4RbPqlQew/TjWhnZBJYGS1AU0IC/oUPpcbA3lcVaAgOv9
 6e45fPq7PaE1c3kV0BSsrgqPG9C4VmvN2s0jQADMJQOQv4/MbAkXgKvnEAntK1002ShE
 1JD87iSZt5VkDt4JHvE15IJqoDc6FnWrdGQF0izjHd1tzeXzahgMJTLELIWOmgEzgesD
 rhiPZAqpeSXu5AOeA6JGYa92uxdgZrrfzkVqBKJ/gQJptdq9AWn9/tItELw9PEAyx4Ed
 T8fSU5KkNEyRVXS//NtoZxwkNYUmD8bP7gqBMwurFSTVPpdZY1gHW34OevJH0/DCF5xn
 4Lrg==
X-Gm-Message-State: APjAAAVGDi+TfvXlN2aQI8uDGvkbYjUjY63TkK2it06+OJ6E3KKQn+8R
 5He+Ji9XvXYuxonPxrETYpWcmb+oX1O5B2nV3GkvIQ==
X-Google-Smtp-Source: APXvYqxu7jzERtujGtRB1JUPTrrSRxaJnnRx7A59gFxSd7DNSrReLEw7sHQTmTBvokQEtVRT1Qlvl4tg5ll4Z2fBIRs=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr9700022oto.207.1560962794186; 
 Wed, 19 Jun 2019 09:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
 <20190619094032.GA8928@lst.de> <20190619163655.GG9360@ziepe.ca>
In-Reply-To: <20190619163655.GG9360@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 19 Jun 2019 09:46:23 -0700
Message-ID: <CAPcyv4hYtQdg0DTYjrJxCNXNjadBSWQ5QaMJYsA-QSribKuwrQ@mail.gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dAeca+NaeasgKg8wLjwxe/d8KFhZwiNtk4NpQn2oH10=;
 b=eEIpXOcPgh/FQm8AcRovuq2bVonIAGIxG4O8hqog+t2sNo8lmrfYIpq/+3PFypMTty
 siI4svCj0XFFk8DvueW2Zz7Zvoia5aS+WjHA2V9kjitsGk2Dr7OrDOGRxd+jgBEHrThr
 EHGL3vlgHvvthlk8Gfj633B1vbDSWX+nCllo+CoYhKFeZWAJNLlFWMmdziVMMg2G+cne
 9LkPYCnW/ZVKV1OTMMtvp9jixEL4J8gu4orI34DCJ30mCCAblY3ezSDjxZuDDDsPUqbB
 ZHR6EtInNGpbX74S1TmPO0TGeYVW9GToDYCY1yWZmGb6+1NQToWu8/vN0HJQG43y5Q4m
 K3fw==
Subject: Re: [Nouveau] dev_pagemap related cleanups v2
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgOTozNyBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMTo0MDozMkFNICswMjAw
LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDEy
OjQ3OjEwUE0gLTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+ID4gPiBHaXQgdHJlZToKPiA+
ID4gPgo+ID4gPiA+ICAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5n
aXQgaG1tLWRldm1lbS1jbGVhbnVwLjIKPiA+ID4gPgo+ID4gPiA+IEdpdHdlYjoKPiA+ID4gPgo+
ID4gPiA+ICAgICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3No
b3J0bG9nL3JlZnMvaGVhZHMvaG1tLWRldm1lbS1jbGVhbnVwLjIKPiA+Cj4gPiA+Cj4gPiA+IEF0
dGFjaGVkIGlzIG15IGluY3JlbWVudGFsIGZpeHVwcyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMsIHdp
dGggdGhvc2UKPiA+ID4gaW50ZWdyYXRlZCB5b3UgY2FuIGFkZDoKPiA+Cj4gPiBJJ3ZlIGZvbGRl
ZCB5b3VyIGluY3JlbWVudGFsIGJpdHMgaW4gYW5kIHB1c2hlZCBvdXQgYSBuZXcKPiA+IGhtbS1k
ZXZtZW0tY2xlYW51cC4zIHRvIHRoZSByZXBvIGFib3ZlLiAgTGV0IG1lIGtub3cgaWYgSSBkaWRu
J3QgbWVzcwo+ID4gdXAgYW55dGhpbmcgZWxzZS4gIEknbGwgd2FpdCBmb3IgYSBmZXcgbW9yZSBj
b21tZW50cyBhbmQgSmFzb24ncwo+ID4gcGxhbm5lZCByZWJhc2Ugb2YgdGhlIGhtbSBicmFuY2gg
YmVmb3JlIHJlcG9zdGluZy4KPgo+IEkgc2FpZCBJIHdvdWxkbid0IHJlYmFzZSB0aGUgaG1tLmdp
dCAoYXMgaXQgbmVlZHMgdG8gZ28gdG8gRFJNLCBBTUQKPiBhbmQgUkRNQSBnaXQgdHJlZXMpLi4K
Pgo+IEluc3RlYWQgSSB3aWxsIG1lcmdlIHY1LjItcmM1IHRvIHRoZSB0cmVlIGJlZm9yZSBhcHBs
eWluZyB0aGlzIHNlcmllcy4KPgo+IEkndmUgdW5kZXJzdG9vZCB0aGlzIHRvIGJlIExpbnVzJ3Mg
cHJlZmVyZWQgd29ya2Zsb3cuCj4KPiBTbywgcGxlYXNlIHNlbmQgdGhlIG5leHQgaXRlcmF0aW9u
IG9mIHRoaXMgYWdhaW5zdCBlaXRoZXIKPiBwbGFpbnY1LjItcmM1IG9yIHY1LjItcmM1IG1lcmdl
ZCB3aXRoIGhtbS5naXQgYW5kIEknbGwgc29ydCBpdCBvdXQuCgpKdXN0IG1ha2Ugc3VyZSB0aGF0
IHdoZW4geW91IGJhY2ttZXJnZSB2NS4yLXJjNSB5b3UgaGF2ZSBhIGNsZWFyCnJlYXNvbiBpbiB0
aGUgbWVyZ2UgY29tbWl0IG1lc3NhZ2UgYWJvdXQgd2h5IHlvdSBuZWVkZWQgdG8gZG8gaXQuCldo
aWxlIG5lZWRsZXNzIHJlYmFzaW5nIGlzIHRvcCBvZiB0aGUgcGV0IHBlZXZlIGxpc3QsIHNlY29u
ZCBwbGFjZSwgYXMKSSBmb3VuZCBvdXQsIGlzIG15c3RlcnkgbWVyZ2VzIHdpdGhvdXQgZXhwbGFu
YXRpb25zLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
