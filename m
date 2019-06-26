Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85156E81
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 18:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696446E497;
	Wed, 26 Jun 2019 16:14:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28046E48F
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jun 2019 16:14:43 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x21so755169otq.12
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jun 2019 09:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XK0CaHJOVcsS/u0euQkBQYUAFEHomal+V6KfwmFuG+U=;
 b=Q0q6S1wIM+f2CdgLIbQDmz0MSX6CnNq4Ysme8aix5r22EcOHlpSIAElimmczQSRVtC
 nNbcDerWcUtPkFUDCZz8ddzgu5iBbwNuor6VdvgPW7ULSHcFXPSnBb74mETYdh9/mMKL
 s3dtyU72et/SX4tQuopxuuiGnjqa0FuwBA23/41P1G+C4iGLdcbBrjXBpCw8w8nlT21q
 h/aXBWIZEC87g8UioPChkZUy3YKqOVVJN/WOqqUnN68dD14laO/sli0eex92M/hLQNXD
 96PRUt0IlMp+46Z9dS7SPGaNPs4TszvgNdGqDy1Sh8sWjyanbWMq6G1FG4PQrOSKik+h
 i9pQ==
X-Gm-Message-State: APjAAAXjDUhEtI3QwkSA7cS3hitL0ulFgNNf1qGX60eiFvU1aYmJImlu
 2rs9/gG1Q+f4d8MGic3VhrP+gnWqhlvpU7j2quouug==
X-Google-Smtp-Source: APXvYqxlK4A4nPLhfNez6panLCe0oG2uZ68rpjoeO+K9OBDO45YdiJCTPi2DLYKpN0RI7gOpjzzUX8DJkFMKIZ4j7YA=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr1155884otn.71.1561565683159; 
 Wed, 26 Jun 2019 09:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de> <20190625150053.GJ11400@dhcp22.suse.cz>
 <CAPcyv4j1e5dbBHnc+wmtsNUyFbMK_98WxHNwuD_Vxo4dX9Ce=Q@mail.gmail.com>
 <20190625190038.GK11400@dhcp22.suse.cz>
 <CAPcyv4hU13v7dSQpF0WTQTxQM3L3UsHMUhsFMVz7i4UGLoM89g@mail.gmail.com>
 <20190626054645.GB17798@dhcp22.suse.cz>
In-Reply-To: <20190626054645.GB17798@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 26 Jun 2019 09:14:32 -0700
Message-ID: <CAPcyv4jLK2F2UHqbwp4bCEiB7tL8sVsr775egKMmJvfZG+W+NQ@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XK0CaHJOVcsS/u0euQkBQYUAFEHomal+V6KfwmFuG+U=;
 b=l+5kJ6tokPJ98bH2NME9M/AQ27NvFMKuOsXn1/Bb6bOBzelrSngvtDZJXmVwZKzpKi
 qjSD/BPNZzWpZiBQzbopXZ4t+Owe9yGEnJZxcLTPAlrrPvnYO2K7gCbSAaaiJHFcBp4k
 rxUq8p1DHnLMI0fRDu2WCtVRP/OHmPtRFurCHJX0OhgjoUZQUqGECtXD/hiUSR9PPelH
 MnkCXYqaYmm4WKtHJZYWuY7L6Kj9qhni0KNGsJokbTzfJurnEEHErfJ69HKEvmfEeo+E
 N7IwPwAkdbg4plX6eEOz52RHtcXnuvonc5/m143W02YNIvHsz5xJAtpZFJ8Hrcf91kdm
 NShw==
Subject: Re: [Nouveau] [PATCH 05/22] mm: export alloc_pages_vma
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
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDYgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUgMjUtMDYtMTkgMTI6NTI6MTgsIERhbiBXaWxsaWFt
cyB3cm90ZToKPiBbLi4uXQo+ID4gPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3RhYmxlLWFwaS1u
b25zZW5zZS5yc3QKPiA+Cj4gPiBUaGF0IGRvY3VtZW50IGhhcyBmYWlsZWQgdG8gcHJlY2x1ZGUg
c3ltYm9sIGV4cG9ydCBmaWdodHMgaW4gdGhlIHBhc3QKPiA+IGFuZCB0aGVyZSBpcyBhIHJlYXNv
bmFibGUgYXJndW1lbnQgdG8gdHJ5IG5vdCB0byByZXRyYWN0IGZ1bmN0aW9uYWxpdHkKPiA+IHRo
YXQgaGFkIGJlZW4gcHJldmlvdXNseSBleHBvcnRlZCByZWdhcmRsZXNzIG9mIHRoYXQgZG9jdW1l
bnQuCj4KPiBDYW4geW91IHBvaW50IG1lIHRvIGFueSBzcGVjaWZpYyBleGFtcGxlIHdoZXJlIHRo
aXMgd291bGQgYmUgdGhlIGNhc2UKPiBmb3IgdGhlIGNvcmUga2VybmVsIHN5bWJvbHMgcGxlYXNl
PwoKVGhlIG1vc3QgcmVjZW50IGV4YW1wbGUgdGhhdCBjb21lcyB0byBtaW5kIHdhcyB0aGUgdGhy
YXNoIGFyb3VuZApfX2tlcm5lbF9mcHVfe2JlZ2luLGVuZH0gWzFdLiBJIHJlZmVyZW5jZWQgdGhh
dCB3aGVuIGRlYmF0aW5nIF9HUEwKc3ltYm9sIHBvbGljeSB3aXRoIErDqXLDtG1lIFsyXS4KClsx
XTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDUyMjEwMDk1OS5HQTE1MzkwQGty
b2FoLmNvbS8KWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBUGN5djRnYityPT1y
aUtGWGtWWjdnR2RuS2U2MnlCbVo3eE9hNHVCQkJ5aG5LOVR6Z0BtYWlsLmdtYWlsLmNvbS8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
