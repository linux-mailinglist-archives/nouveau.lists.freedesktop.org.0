Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3932B875
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8D6E999;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972889E69
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l22so5229191wme.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBm1TtnSOgkIdE+poP2XHRBabvEfYrHEJwcqomHGK4I=;
 b=CobjywY2f31xvahThtnf+1J/tPkCZZLUOzDN9k925p+K3ljoBNUuwGN6Z04oqnMIPI
 WS1MUrwyT0+HPr+bF9JgzQWmvgClLWJo5rzB40dMh9V5sv/Yq8nYX3E/F1e9qb0ufBpc
 5R8UsMIhy7JVlgVo1/18XfYf+wP4uLAb+RWHY37577RbXX6pd5jXuE34eefan1RAvX/m
 GvImGq+2Q4Rmx4plYwdwDh6zhOaXjXOA9Dhsa/U9Qym0hc8ELB2Y8W5EzXNViMZFdKHL
 jm+T25PBHcD0TK81K8m8O8oDvH2G4UqZTtjl3pd1izvptFsGjlScPG2R+aJxykccdEAg
 zjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBm1TtnSOgkIdE+poP2XHRBabvEfYrHEJwcqomHGK4I=;
 b=IMIDh1viNzNU4Hh/gHeoHv6DjKJrON76PjthKzUoFfkLlJBUSerVfo1zyf81egZ+yO
 ejGkMbC+ndChFs6Su2e4C85tQGxUSF+fq7OWQYnZFY9pUZzyP5XE0bFpnirowgzpkvdB
 gGpr8p3y/tRDI+suJ5as5u4z176jPgaqFK0qjHvDHadm5IrduvWzlK2qOd9xBOC93E3E
 AT3kjRzZqR3ql09Fe88of549TGz3oiUXQtIgeAUhfJhaGuoVNf+Shu1+ztN1687APH/S
 qGhgcG11MpTVFCWsvo2/+S6ZHTbIZsSmSRn//uiKwHXmNsl301QbOrd8FazfSeUp4GUc
 RI9Q==
X-Gm-Message-State: AOAM531H7XSUU9QMCbzz8yqKRys2EPluTV67HBxz8T36949RgbOV+E1z
 FBS0+KLtrdhKyuskMUcZ06Dmfw==
X-Google-Smtp-Source: ABdhPJxDWAS0QekMYikPudJ4qNiYAhq/iWdMPZuZl8uyYTy6BkFNsfoxpNYhdQ/7ZfCkCJrNbg2EpA==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr9567391wme.12.1614779009161; 
 Wed, 03 Mar 2021 05:43:29 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:26 +0000
Message-Id: <20210303134319.3160762-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIHJlc2VuZC4gIEFsbCBvZiB0aGVzZSBwYXRjaGVzIGhhdmUgYmVlbiBzZW50IGJl
Zm9yZS4KClRoZSB2bXdnZnggb25lcyB3ZXJlIGV2ZW4gYXBwbGllZCwgYnV0IHdlcmUgZHJvcHBl
ZCBmb3Igc29tZSByZWFzb24uCgpMZWUgSm9uZXMgKDUzKToKICBkcm0vbm91dmVhdS9udmttL3N1
YmRldi9iaW9zL2luaXQ6IERlbW90ZSBvYnZpb3VzIGFidXNlIG9mIGtlcm5lbC1kb2MKICBkcm0v
bm91dmVhdS9kaXNwbnY1MC9kaXNwOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnCiAgZHJt
L21zbS9kcC9kcF9kaXNwbGF5OiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdocGQnCiAgZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZQog
IGluY2x1ZGU6IGRybTogZHJtX2F0b21pYzogTWFrZSB1c2Ugb2YgJ25ld19wbGFuZV9zdGF0ZScK
ICBkcm0vbm91dmVhdS9udmttL3N1YmRldi92b2x0L2drMjBhOiBEZW1vdGUgbm9uLWNvbmZvcm1h
bnQga2VybmVsLWRvYwogICAgaGVhZGVycwogIGRybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1h
bmRfdGFibGU6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgYW5kCiAgICBhc3NvY2lhdGVkIGNvbW1l
bnQKICBkcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzOiBNb3ZlIHNvbWUgbGFyZ2Ug
dmFyaWFibGVzIGZyb20gdGhlCiAgICBzdGFjayB0byB0aGUgaGVhcAogIGRybS9hbWQvZGlzcGxh
eS9kYy9jYWxjcy9kY2VfY2FsY3M6IFJlbW92ZSBzb21lIGxhcmdlIHZhcmlhYmxlcyBmcm9tCiAg
ICB0aGUgc3RhY2sKICBkcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXg6IFJlbW92ZSBkdXBs
aWNhdGUgbGluZSBjYXVzaW5nICdmaWVsZAogICAgb3ZlcndyaXR0ZW4nIGlzc3VlCiAgZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlOiBNYWtlIGxvY2FsIGZ1bmN0aW9ucyBz
dGF0aWMKICBkcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9nZjEwMDogRGVtb3RlIG5vbi1jb25m
b3JtYW50IGtlcm5lbC1kb2MKICAgIGhlYWRlcgogIGRybS9ub3V2ZWF1L25vdXZlYXVfYm86IFJl
bW92ZSB1bnVzZWQgdmFyaWFibGVzICdkZXYnCiAgZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5
OiBSZW1vdmUgc2V0IGJ1dCB1bnVzZWQgdmFyaWFibGUgJ3dpZHRoJwogIGRybS9ub3V2ZWF1L2Rp
c3BudjA0L2NydGM6IERlbW90ZSBub24tY29uZm9ybWluZyBrZXJuZWwtZG9jIGhlYWRlcnMKICBk
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnIGZy
b20gZnVuY3Rpb24KICAgIHJldHVybmluZyB2b2lkCiAgZHJtL25vdXZlYXUvZGlzcG52NTAvaGVh
ZGM1N2Q6IE1ha2UgbG9jYWwgZnVuY3Rpb24gJ2hlYWRjNTdkX29sdXQnCiAgICBzdGF0aWMKICBk
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXk6IFJlbW92ZSBzdXBlcmZsdW91cyBwcm90b3R5cGUgZm9y
IGxvY2FsCiAgICBzdGF0aWMgZnVuY3Rpb25zCiAgZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcDog
SW5jbHVkZSBoZWFkZXIgY29udGFpbmluZyBvdXIgcHJvdG90eXBlcwogIGRybS9ub3V2ZWF1L25v
dXZlYXVfaW9jMzI6IEZpbGUgaGVhZGVycyBhcmUgbm90IGdvb2QgY2FuZGlkYXRlcyBmb3IKICAg
IGtlcm5lbC1kb2MKICBkcm0vbm91dmVhdS9ub3V2ZWF1X3N2bTogUmVtb3ZlIHVudXNlZCB2YXJp
YWJsZSAncmV0JyBmcm9tIHZvaWQKICAgIGZ1bmN0aW9uCiAgZHJtL25vdXZlYXUvbm91dmVhdV9p
b2MzMjogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UgdG8gc3RhbmRhcmQgY29tbWVudAogICAgYmxv
Y2sKICBkcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmOiBGaXggc29tZSBrZXJuZWwtZG9jIHJlbGF0
ZWQgaXNzdWVzCiAgZHJtL3Ztd2dmeC92bXdnZnhfa21zOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxl
ICdyZXQnIGZyb20KICAgICd2bXdfZHVfcHJpbWFyeV9wbGFuZV9hdG9taWNfY2hlY2soKScKICBk
cm0vdm13Z2Z4L3Ztd2dmeF9rbXM6IE1hcmsgdm13X3tjdXJzb3IscHJpbWFyeX1fcGxhbmVfZm9y
bWF0cyBhcwogICAgX19tYXliZV91bnVzZWQKICBkcm0vdm13Z2Z4L3Ztd2dmeF9kcnY6IEZpeCBz
b21lIGtlcm5lbC1kb2MgbWlzZGVtZWFub3VycwogIGRybS92bXdnZngvdm13Z2Z4X2lvY3RsOiBQ
cm92aWRlIG1pc3NpbmcgJ0AnIHNpZ24gcmVxdWlyZWQgYnkKICAgIGtlcm5lbC1kb2MKICBkcm0v
dm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZTogRml4IHdvcnRoeSBmdW5jdGlvbiBoZWFkZXJzIGRlbW90
ZSBzb21lCiAgICBvdGhlcnMKICBkcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyOiBTdXBwbHkg
c29tZSBtaXNzaW5nIHBhcmFtZXRlcgogICAgZGVzY3JpcHRpb25zCiAgZHJtL3Ztd2dmeC92bXdn
ZnhfZmlmbzogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVyCiAgZHJtL3Zt
d2dmeC92bXdnZnhfbGR1OiBTdXBwbHkgZGVzY3JpcHRpb25zIGZvciAnc3RhdGUnIGZ1bmN0aW9u
CiAgICBwYXJhbWV0ZXIKICBkcm0vdm13Z2Z4L3Ztd2dmeF9rbXM6IFVwZGF0ZSB3b3J0aHkgZnVu
Y3Rpb24gaGVhZGVycyBhbmQgZGVtb3RlCiAgICBvdGhlcnMKICBkcm0vdm13Z2Z4L3Ztd2dmeF9v
dmVybGF5OiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZXMgdG8gc3RhbmRhcmQKICAgIGNvbW1lbnQg
YmxvY2tzCiAgZHJtL3Ztd2dmeC92bXdnZnhfZmVuY2U6IEFkZCwgcmVtb3ZlIGFuZCBkZW1vdGUg
dmFyaW91cyBkb2N1bWVudGF0aW9uCiAgICBwYXJhbXMvaGVhZGVycwogIGRybS92bXdnZngvdm13
Z2Z4X2JvOiBSZW1vdmUgc3VwZXJmbHVvdXMgcGFyYW0gZGVzY3JpcHRpb24gYW5kIHN1cHBseQog
ICAgYW5vdGhlcgogIGRybS92bXdnZngvdm13Z2Z4X2NvbnRleHQ6IERlbW90ZSBrZXJuZWwtZG9j
IGFidXNlcwogIGRybS92bXdnZngvdm13Z2Z4X3Njcm46IERlbW90ZSB1bndvcnRoeSBrZXJuZWwt
ZG9jIGhlYWRlcnMgYW5kIHVwZGF0ZQogICAgb3RoZXJzCiAgZHJtL3Ztd2dmeC92bXdnZnhfc3Vy
ZmFjZTogRml4IHNvbWUga2VybmVsLWRvYyByZWxhdGVkIGlzc3VlcwogIGRybS92bXdnZngvdm13
Z2Z4X2NtZGJ1Zl9yZXM6IFJlbmFtZSBwYXJhbSBkZXNjcmlwdGlvbiBhbmQgcmVtb3ZlCiAgICBh
bm90aGVyCiAgZHJtL3Ztd2dmeC92bXdnZnhfc2hhZGVyOiBEZW1vdGUga2VybmVsLWRvYyBhYnVz
ZXMgYW5kIGZpeC11cCB3b3J0aHkKICAgIGhlYWRlcnMKICBkcm0vdm13Z2Z4L3Ztd2dmeF9jbWRi
dWY6IEZpeCBhIGJ1bmNoIG9mIG1pc3Npbmcgb3IgaW5jb3JyZWN0bHkKICAgIGZvcm1hdHRlZC9u
YW1lZCBwYXJhbXMKICBkcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzOiBSZW1vdmUgdW51c2Vk
IHZhcmlhYmxlICdyZXQnCiAgZHJtL3Ztd2dmeC92bXdnZnhfc3RkdTogQWRkIHNvbWUgbWlzc2lu
ZyBwYXJhbS9tZW1iZXIgZGVzY3JpcHRpb25zCiAgZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmOiBG
aXggbWlzbmFtaW5nIG9mICdoZWFkZXJzJyBzaG91bGQgYmUgcGx1cmFsCiAgZHJtL3Ztd2dmeC92
bXdnZnhfY290YWJsZTogRml4IGEgY291cGxlIG9mIHNpbXBsZSBkb2N1bWVudGF0aW9uCiAgICBw
cm9ibGVtcwogIGRybS92bXdnZngvdm13Z2Z4X3NvOiBBZGQgZGVzY3JpcHRpb24gZm9yICd2bXdf
dmlldydzICdyY3UnIG1lbWJlcgogIGRybS92bXdnZngvdm13Z2Z4X2JpbmRpbmc6IFByb3ZpZGUg
c29tZSBtaXNzaW5nIHBhcmFtIGRlc2NyaXB0aW9ucyBhbmQKICAgIHJlbW92ZSBvdGhlcnMKICBk
cm0vdm13Z2Z4L3Ztd2dmeF9tc2c6IEZpeCBtaXNzcGVsbGluZyBvZiAnbXNnJwogIGRybS92bXdn
Zngvdm13Z2Z4X2JsaXQ6IEFkZCBkZXNjcmlwdGlvbiBmb3IgJ3Ztd19ib19jcHVfYmxpdCdzICdk
aWZmJwogICAgcGFyYW0KICBkcm0vdm13Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uOiBBZGQgc29tZSBt
aXNzaW5nIHN0cnVjdCBtZW1iZXIvZnVuY3Rpb24KICAgIHBhcmFtIGRlc2NyaXB0aW9ucwogIGRy
bS92bXdnZngvdHRtX29iamVjdDogRGVtb3RlIGhhbGYtYXNzZWQgaGVhZGVycyBhbmQgZml4LXVw
IGFub3RoZXIKICBkcm0vdm13Z2Z4L3Ztd2dmeF90aHA6IEFkZCBkZXNjcmlwdGlvbiBmb3IgJ3Zt
d190aHBfbWFuYWdlcidzIG1lbWJlcgogICAgJ21hbmFnZXInCiAgZHJtL3Ztd2dmeC90dG1fb2Jq
ZWN0OiBSZW9yZGVyIGhlYWRlciB0byBpbW1lZGlhdGVseSBwcmVjZWRlIGl0cwogICAgc3RydWN0
CgogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYyAgIHwgICAxNiAr
LQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgIHwgMTE1MSAr
KysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
YXV4LmggIHwgICAgMSAtCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291
cmNlLmMgfCAgIDE2ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyAgICAg
ICAgICAgfCAgICAzIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYyAg
ICAgICB8ICAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAg
ICAgICB8ICAgMTAgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdk
LmMgICB8ICAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgICAg
ICAgICB8ICAgIDQgLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMg
ICAgIHwgICAgOCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9pb2MzMi5jICAg
ICAgIHwgICAgNCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyAgICAg
ICAgIHwgICAgNSArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmggICAg
ICAgIHwgICAgMyAtCiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwLmMg
ICAgfCAgICAyICstCiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5j
ICAgfCAgMjA0ICstLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi92b2x0L2drMjBh
LmMgIHwgICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmMgICAgICAg
ICAgIHwgICAyNSArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYmluZGluZy5jICAg
ICAgIHwgICAgOSArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYmxpdC5jICAgICAg
ICAgIHwgICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jICAgICAgICAg
ICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWQuYyAgICAgICAg
ICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyAgICAg
ICAgfCAgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMg
ICAgfCAgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb250ZXh0LmMgICAg
ICAgfCAgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb3RhYmxlLmMgICAg
ICAgfCAgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICAgICAg
ICAgfCAgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgICAg
ICAgfCAgIDIwICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9mZW5jZS5jICAgICAg
ICAgfCAgIDE4ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bC5jICAgICAg
ICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyAgICAgICAg
ICAgfCAgIDE2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaCAgICAgICAg
ICAgfCAgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9sZHUuYyAgICAgICAg
ICAgfCAgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cuYyAgICAgICAg
ICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9vdmVybGF5LmMgICAg
ICAgfCAgIDE2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5jICAg
ICAgfCAgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMgICAgICAg
ICAgfCAgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zaGFkZXIuYyAgICAg
ICAgfCAgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zby5jICAgICAgICAg
ICAgfCAgICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUuYyAgICAgICAg
ICB8ICAgIDkgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyAgICAg
ICB8ICAgMTcgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3RocC5jICAgICAgICAg
ICB8ICAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jICAg
IHwgICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uLmMgICAg
fCAgICA1ICstCiBpbmNsdWRlL2RybS9kcm1fYXRvbWljLmggICAgICAgICAgICAgICAgICAgICAg
fCAgICAzICstCiA0NCBmaWxlcyBjaGFuZ2VkLCA4MTggaW5zZXJ0aW9ucygrKSwgODQ3IGRlbGV0
aW9ucygtKQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBBbnRob255IEtvbyA8QW50aG9ueS5L
b29AYW1kLmNvbT4KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IEplcmVteSBLb2xiIDxqa29sYkBicmFuZGVp
cy5lZHU+CkNjOiBLdW9nZWUgSHNpZWggPGtoc2llaEBjb2RlYXVyb3JhLm9yZz4KQ2M6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5l
bC5vcmc+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogUWluZ2xhbmcgTWlh
byA8bWlhb3FpbmdsYW5nQGh1YXdlaS5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYi5jbGFya0BsaW5h
cm8ub3JnPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogUm9sYW5kIFNj
aGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IFZNd2FyZSBHcmFwaGljcyA8
bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogWmFjayBSdXNpbiA8emFj
a3JAdm13YXJlLmNvbT4KLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
