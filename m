Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA033F4FB
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 17:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78886E835;
	Wed, 17 Mar 2021 16:05:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8BB89AD2
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 08:17:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j7so851345wrd.1
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aQQTr9x52WQZKbGN+UXyTfuQuaro1IAnE7CQNIF7EbQ=;
 b=rRsEAx6F2ouRMDv3fBBX9mDEf8icI52AiOIMJydya6x9UZqnppIvI6XSwDSxnntRMV
 wujEyUkyZkaHaSdl7lbvibzroxqY2gth5BM5cUpakazc2JHIEYFfEaRrPtI2awbMRA4U
 u/tVzLXMMw7jI+1rQhsMyvbcaG0usBhJM1xkGPlhYsrnhHZNYsO4UVGDWykv9Z5svoO4
 SWjItz8pw2cklFtc1Phz1+whnj4HEFPJGgOqEuf183+3ad6AML7i9L0JE1uvBNum0Wnw
 /Y8VQhLtB/JbXzwTIBYOobcwMIAHsfoBUsVi3emW9HPR/r/vWxFyWR18uEnT3CbTOnKo
 66bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aQQTr9x52WQZKbGN+UXyTfuQuaro1IAnE7CQNIF7EbQ=;
 b=taXdB11Vmsb6x/cjaCDQHQIovJp1+oV+Sx9Jk2JNqSOSzrKcpYJSxxpgd8KUT0a1Yf
 nve37bBRIKSEDeY9RTWBEpdBqPybW6s4F2n3+GOaZe2FYn/s1UurgJ1tTYivntqriELN
 Plz5B324+el3FRQ7Dsr2xCCKc5M5PUP0mOwMvohLrcW0iQ8dL53inH8FmUZtkGfKmxtX
 P7roxGgcBnh3vEhUeVV0J5reyQxp6b5m0E7/AH+zzmJdwMRBK/75o6WD44om3GMaEWwt
 7JUc+CO3OYaK7QcqzEvcSeg6AWaBWpJdlgUD2ZdU1UNw/Jx3PBhO9cob0juZbH1n/T4a
 0IFw==
X-Gm-Message-State: AOAM533uM5cNrdVrlBaDvzmYYUOVJheSMDtDtK7AkJKfnX/YhfEU5uv9
 G7SkkRTAddJntUK/LXhd6sk1sw==
X-Google-Smtp-Source: ABdhPJy+NLJm3S/51dMjrLtGpbwVG+P/h3mK0TfjCNGg++tWCJlVzWFiOG8og26jGqtuchvHPsPpNg==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr3056746wru.401.1615969057113; 
 Wed, 17 Mar 2021 01:17:37 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id v9sm25014417wrn.86.2021.03.17.01.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 01:17:36 -0700 (PDT)
Date: Wed, 17 Mar 2021 08:17:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
Message-ID: <20210317081729.GH701493@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell> <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311135152.GT701493@dell>
X-Mailman-Approved-At: Wed, 17 Mar 2021 16:05:34 +0000
Subject: Re: [Nouveau] [RESEND 00/53] Rid GPU from W=1 warnings
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAxMSBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBUaHUsIDExIE1hciAy
MDIxLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IAo+ID4gT24gTW9uLCBNYXIgMDgsIDIwMjEgYXQg
MDk6MTk6MzJBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBGcmksIDA1IE1hciAy
MDIxLCBSb2xhbmQgU2NoZWlkZWdnZXIgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IFRoZSB2bXdnZngg
b25lcyBsb29rIGFsbCBnb29kIHRvIG1lLCBzbyBmb3IKPiA+ID4gPiAyMy01MzogUmV2aWV3ZWQt
Ynk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgo+ID4gPiA+IFRoYXQg
c2FpZCwgdGhleSB3ZXJlIGFscmVhZHkgc2lnbmVkIG9mZiBieSBaYWNrLCBzbyBub3Qgc3VyZSB3
aGF0Cj4gPiA+ID4gaGFwcGVuZWQgaGVyZS4KPiA+ID4gCj4gPiA+IFllcywgdGhleSB3ZXJlIGFj
Y2VwdGVkIGF0IG9uZSBwb2ludCwgdGhlbiBkcm9wcGVkIHdpdGhvdXQgYSByZWFzb24uCj4gPiA+
IAo+ID4gPiBTaW5jZSBJIHJlYmFzZWQgb250byB0aGUgbGF0ZXN0IC1uZXh0LCBJIGhhZCB0byBw
bHVjayB0aGVtIGJhY2sgb3V0IG9mCj4gPiA+IGEgcHJldmlvdXMgb25lLgo+ID4gCj4gPiBUaGV5
IHNob3VsZCBzaG93IHVwIGluIGxpbnV4LW5leHQgYWdhaW4uIFdlIG1lcmdlIHBhdGNoZXMgZm9y
IG5leHQgbWVyZ2UKPiA+IHdpbmRvdyBldmVuIGR1cmluZyB0aGUgY3VycmVudCBtZXJnZSB3aW5k
b3csIGJ1dCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGV5Cj4gPiBkb24ndCBwb2xsdXRlIGxpbnV4LW5l
eHQuIE9jY2FzaW9uYWxseSB0aGUgY3V0IG9mZiBpcyB3cm9uZyBzbyBwYXRjaGVzCj4gPiBzaG93
IHVwLCBhbmQgdGhlbiBnZXQgcHVsbGVkIGFnYWluLgo+ID4gCj4gPiBVbmZvcnR1bmF0ZWx5IGVz
cGVjaWFsbHkgdGhlIDUuMTIgbWVyZ2UgY3ljbGUgd2FzIHZlcnkgd29iYmx5IGR1ZSB0byBzb21l
Cj4gPiBjb25mdXNpb24gaGVyZS4gQnV0IHlvdXIgcGF0Y2hlcyBzaG91bGQgYWxsIGJlIGluIGxp
bnV4LW5leHQgYWdhaW4gKHRoZXkKPiA+IGFyZSBxdWV1ZWQgdXAgZm9yIDUuMTMgaW4gZHJtLW1p
c2MtbmV4dCwgSSBjaGVja2VkIHRoYXQpLgo+ID4gCj4gPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lv
biBoZXJlLgo+IAo+IE9oLCBJIHNlZS4gIFdlbGwgc28gbG9uZyBhcyB0aGV5IGRvbid0IGdldCBk
cm9wcGVkLCBJJ2xsIGJlIGhhcHB5Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uIERh
bmllbAoKQWZ0ZXIgcmViYXNpbmcgdG9kYXksIGFsbCBvZiBteSBHUFUgcGF0Y2hlcyBoYXZlIHJl
bWFpbmVkLiAgV291bGQKc29tZW9uZSBiZSBraW5kIGVub3VnaCB0byBjaGVjayB0aGF0IGV2ZXJ5
dGhpbmcgaXMgc3RpbGwgaW4gb3JkZXIKcGxlYXNlPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
